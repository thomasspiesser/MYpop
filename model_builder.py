#!/usr/bin/python
# -*- coding: iso-8859-1 -*-

import subprocess,sys,re
from numpy import array

def find_and_replace(pattern, dest_str, repl_str):
    re_comp = re.compile(r'%s(?=\W|$)'%(pattern)) # not followed by alphanumeric [a-zA-Z0-9_] or (|) is at end of string ($)
    return re_comp.sub(repl_str, dest_str) # with correct user parameters if used


class model_builder:
    """receive model information, process to build system.h file and compile the model so that it is an executable C program. provides function for simulating the model as well. """
    def __init__(self, _m, _path, T_END):
        self.para_dict = dict([(p,nr) for nr, p in enumerate(_m.parameters)]) # parameter names with parameter indices
        # self.build_system_file_C(_m, _path, T_END)
        # self.compile_model(_path)
        # self.build_system_file_python(_m, _path)

    def build_system_file_C(self,_m, _path, T_END):
        f = open(_path+'C/system.h','w')
        f.write('#include <math.h>\n')
        f.write('#ifndef SYSTEM_H_INCLUDED\n#define SYSTEM_H_INCLUDED\n\n')
        f.write('#define NEQ %s // number of equations \n'%( len(_m.species) ) )
        f.write('#define NK %s // number of parameters \n'%( len(_m.parameters) ) )
        f.write('#define T_START 0.0 // start time \n' )
        f.write('#define T_END %s // end time \n\n'%( T_END ) ) # specify end time here, steps will be T_END - T_START
        f.write('double y_start[NEQ]; // init conditions vector, can also be set explicitly, e.g. double y_start[] = { 10.0, 10.0 }; \n\n' )
        f.write('double k[NK]; // parameter vector \n\n' )
        f.write('// equation system \n' )
        f.write('void system(int *neq, double *t, double *y, double *ydot) \n' )
        f.write('{\n')
        for index,species in enumerate(_m.species):
            new_diff_equation = _m.diff_equations[species]
            for p in self.para_dict:
                new_diff_equation = new_diff_equation.replace(p,'k[%s]'%(self.para_dict[p])) # replace parameter names with parameter indices -> k[index]
            for ind,spe in enumerate(_m.species):
                new_diff_equation = new_diff_equation.replace(spe,'y[%s]'%(ind)) # replace species names with indices -> y[index]
            f.write('    ydot[%s] =%s;\n'%(index,new_diff_equation)) # zB ydot[0] = y[0]*( k[0] - k[1]*y[1] );
        f.write('}\n\n')
        f.write('#endif // SYSTEM_H_INCLUDED')
        f.close()
        return None

    def compile_model(self, _path):
        """ need libs (odepack, gfortran) and system.h file in the same directory """
        # cmd = g++ main.cpp system.h -omodel.out -lodepack -L./ -lgfortran
        process = subprocess.Popen(["g++", _path+"C/main.cpp", _path+"C/system.h", "-o"+_path+"C/model.out", "-L"+_path+"C/", "-lodepack", "-lgfortran"], stderr=subprocess.PIPE)
        stdout,stderr = process.communicate()
        if stderr: print 'ERROR: ', stderr
        return None

    def simulate(self,_m,current_s,current_p, _path):
        """ simulate C model """
        process = subprocess.Popen(["./"+_path+ "C/model.out"] + [str(current_p[p]) for p in _m.parameters] + [str(s) for s in current_s], stdout=subprocess.PIPE) # get error with stderr=subprocess.PIPE
        my_out_list=[i.replace('  \n','') for i in process.stdout.readlines()] # get rid of newlines
        my_out_list=array([[float(i) for i in line.split('  ')] for line in my_out_list]) # split and convert from string to float
        return my_out_list

    def build_user_eq_system_python(self,_m, _path):
        f= open(_path+'user_eq_system.py','w')
        f.write('#!/usr/bin/python\n# -*- coding: iso-8859-1 -*-\n\n')
        f.write('from numpy import array\n\n')
        f.write('def dY_dt(y,t,k):\n')
        f.write('    return array([\n')
        for index,species in enumerate(_m.species):
            new_diff_equation = _m.diff_equations[species]
            for ind, spe in enumerate(_m.species):
                new_diff_equation = find_and_replace(pattern=spe, dest_str=new_diff_equation, repl_str='Y[%s]'%(ind))
            for ind, p in enumerate(_m.parameters):
                new_diff_equation = find_and_replace(pattern=p, dest_str=new_diff_equation, repl_str='p[%s]'%(ind))
            new_diff_equation= new_diff_equation.strip() # get rid of leading and trailing \n\t oder ' '
            if index == len(_m.species)-1:
                f.write('   %s\n'%new_diff_equation)
            else:
                f.write('   %s,\n'%new_diff_equation)
        f.write('    ])')
        f.close()
        return None         


    def build_merged_system_file_python(self,_m, _path):
        #read in v5 equation system
        f= open(_path+'v5_eq_system_w_modifiers.py','r')
        a=f.readlines()
        f.close()

        v5_species=dict([('mCLN12','Y[0]'), ('Cln12','Y[1]'), ('B_R','Y[2]'), ('B_Am','Y[3]'), ('B_Ad','Y[4]'), ('mB_R','Y[5]'), ('mB_A','Y[6]')])
        v5_species_list=['mCLN12','Cln12','B_R','B_Am','B_Ad','mB_R','mB_A']
        v5_params=dict([('k_d1','p[0]'),('k_d2','p[1]'),('k_p1','p[2]'),('k_R','p[3]'),('k_Am','p[4]'),('k_Ad','p[5]'),('growth','p[6]'),('A_t','p[7]'),('V_t','p[8]')])
        global_eq_modifiers = ['k__mCLN12','k__Cln12_plus','k__Cln12_minus','k__B_R','k__B_Am','k__B_Ad','k__mB_R','k__mB_A']
        
        # check for v5_species, defined in user_model:
        v5_add_equations=dict() # put additional user def equations in here
        v5_user_species=list(set(v5_species).intersection(set(_m.species_names.values()))) # v5 species with add def by user
        v5_user_species_name_id= dict([(sname, sid) for sid, sname in _m.species_names.items() if sname in v5_user_species]) # dict of key: name, value: id of all v5 species that have been defined as species by user
        v5_user_pars=list(set(v5_params).intersection(set(_m.parameter_names.values()))) # v5 species with add def by user
        v5_user_pars_name_id= dict([(pname, pid) for pid, pname in _m.parameter_names.items() if pname in v5_user_pars]) # dict of key: name, value: id of all v5 species that have been defined as species by user
        
        for sname, sid in v5_user_species_name_id.items():
            if _m.diff_equations[sid]:
                v5_add_equations[sname] = _m.diff_equations[sid]
            _m.species.remove(sid) # delete v5_species from model_species_list
            del _m.diff_equations[sid] # delete diff_eq of v5_species
            del _m.species_values[sid] # delete value of v5_species
            del _m.species_names[sid] # delete name of v5_species

        self.n_para_dict = dict([(p,nr+len(v5_params)) for nr, p in enumerate(_m.parameters)]) # parameter names with v5 updated parameter indices, so new parameters start at p[9]
        self.n_spe_dict = dict([(s,nr+len(v5_species)) for nr, s in enumerate(_m.species)]) # species names with v5 updated species indices, so new equations start with Y[7]

        def convert_equation(convert_str):
            convert_str = convert_str.replace( 'compartment_1 * ', '' )
            for sname, sid in v5_user_species_name_id.items():
                convert_str = find_and_replace(pattern=sid, dest_str=convert_str, repl_str=v5_species[sname])
            for pname, pid in v5_user_pars_name_id.items():
                convert_str = find_and_replace(pattern=pid, dest_str=convert_str, repl_str=v5_params[pname])
            for spe in _m.species:
                convert_str = find_and_replace(pattern=spe, dest_str=convert_str, repl_str='Y[%s]'%(self.n_spe_dict[spe]))
            for p in _m.parameters:
                convert_str = find_and_replace(pattern=p, dest_str=convert_str, repl_str='p[%s]'%(self.n_para_dict[p]))
            return convert_str

        f= open(_path+'merged_eq_system.py','w')
        for i in a[:8]: f.write(i) # write the first always equal lines
        for eq,eq_name in zip(a[8:-1], v5_species_list): # the equation part, to be modified in the following
            new_eq = eq.replace(',','') #  get rid of the end of line semi-colon
            new_eq=new_eq.strip()
            if eq_name in v5_add_equations:
                new_eq = new_eq+convert_equation(v5_add_equations[eq_name]) # add reactions to v5_species if user specified
            for modifier in global_eq_modifiers:
                if modifier in new_eq:  # if the modifier is in the equation
                    if modifier in _m.parameter_names.values(): # if global system modifier is specified
                        pid = [pid for pid, pname in _m.parameter_names.items() if pname == modifier][0] # get id of parameter that has been specified to be a global modifier
                        if _m.rules and pid in _m.rules:
                            global_eq_modifier = _m.rules[pid] # if it is a rule, replace by rule equation
                            # print global_eq_modifier, '1'
                            for i in range(5): # check 5 levels deep if there are parameters that need to be replaced by rules
                                for rule_key in _m.rules:
                                    m1 = re.compile(r'%s$'%(rule_key)) # at the end of the string
                                    m2 = re.compile(r'%s(?=\W)'%(rule_key)) # not followed by another digit
                                    global_eq_modifier = m1.sub(_m.rules[rule_key],global_eq_modifier)
                                    global_eq_modifier = m2.sub('( '+_m.rules[rule_key]+' )',global_eq_modifier)
                            global_eq_modifier = convert_equation(global_eq_modifier)
                        else:
                            global_eq_modifier = _m.parameter_values[pid] # if not a rule, set to parameter value
                    else:
                        global_eq_modifier = 1.0 # or if not specified, set to 1
                    new_eq = new_eq.replace(modifier,str(global_eq_modifier))
            f.write('    '+new_eq+',\n') # write the modified equation with semi-colon and newline
        # and now append the new equation for user species as specified in SBML file:
        for index,species in enumerate(_m.species):
            new_diff_equation = _m.diff_equations[species]
            new_diff_equation = convert_equation(new_diff_equation)
            new_diff_equation= new_diff_equation.strip() # get rid of leading and trailing \n\t oder ' '
            if index == len(_m.species)-1:
                f.write('    %s\n'%new_diff_equation)
            else:
                f.write('    %s,\n'%new_diff_equation)
        f.write('    ])')
        f.close()
        return None


    def build_merged_eq_sys(self,_m, _path):
        #read in core equation system
        f= open(_path+'core_eq_system_w_modifiers.py','r')
        a=f.readlines()
        f.close()

        core_species=dict([('mCLN','Y[0]'), ('Cln','Y[1]'), ('B_R','Y[2]'), ('B_Am','Y[3]'), ('B_Ad','Y[4]'), ('mB_R','Y[5]'), ('mB_A','Y[6]'), ('mCLB','Y[7]'), ('Clb','Y[8]')])
        core_species_list=['mCLN','Cln','B_R','B_Am','B_Ad','mB_R','mB_A','mCLB','Clb']
        core_params=dict([('k_d1','p[0]'),('k_p1','p[1]'),('k_d2','p[2]'),('k_R','p[3]'),('k_Am','p[4]'),('k_Ad','p[5]'),('growth','p[6]'),('k_d3','p[7]'),('k_p2','p[8]'),('k_d4','p[9]'),('A_t','p[10]'),('V_t','p[11]')])
        global_eq_modifiers = ['k__mCLN','k__Cln_plus','k__Cln_minus','k__B_R','k__B_Am','k__B_Ad','k__mB_R','k__mB_A','k__mCLB','k__Clb_plus','k__Clb_minus']
        
        # check for core_species, defined in user_model:
        core_add_equations=dict() # put additional user def equations in here
        core_user_species=list(set(core_species).intersection(set(_m.species_names.values()))) # core species with add def by user
        core_user_species_name_id=dict([(sname, sid) for sid, sname in _m.species_names.items() if sname in core_user_species]) # dict of key: name, value: id of all core species that have been defined as species by user
        core_user_pars=list(set(core_params).intersection(set(_m.parameter_names.values()))) # core pars used by user
        core_user_pars_name_id= dict([(pname, pid) for pid, pname in _m.parameter_names.items() if pname in core_user_pars]) # dict of key: name, value: id of all core pars that have been used by user
        
        for sname, sid in core_user_species_name_id.items():
            if _m.diff_equations[sid] and _m.diff_equations[sid]!='0':
                # diff eqs of empty or constant species are initialized with 'dX/dt=0'. The 0 should not be added to our core diff eqs
                core_add_equations[sname] = _m.diff_equations[sid]
            _m.species.remove(sid) # delete core_species from model_species_list
            del _m.diff_equations[sid] # delete diff_eq of core_species
            del _m.species_values[sid] # delete value of core_species
            del _m.species_names[sid] # delete name of core_species

        self.n_para_dict = dict([(p,nr+len(core_params)) for nr, p in enumerate(_m.parameters)]) # parameter names with core updated parameter indices, so new parameters start at p[12]
        self.n_spe_dict = dict([(s,nr+len(core_species)) for nr, s in enumerate(_m.species)]) # species names with core updated species indices, so new equations start with Y[9]

        def convert_equation(convert_str):
            convert_str = convert_str.replace( 'compartment_1 * ', '' )
            for sname, sid in core_user_species_name_id.items():
                convert_str = find_and_replace(pattern=sid, dest_str=convert_str, repl_str=core_species[sname])
            for pname, pid in core_user_pars_name_id.items():
                convert_str = find_and_replace(pattern=pid, dest_str=convert_str, repl_str=core_params[pname])
            for spe in _m.species:
                convert_str = find_and_replace(pattern=spe, dest_str=convert_str, repl_str='Y[%s]'%(self.n_spe_dict[spe]))
            for p in _m.parameters:
                convert_str = find_and_replace(pattern=p, dest_str=convert_str, repl_str='p[%s]'%(self.n_para_dict[p]))
            return convert_str

        f= open(_path+'merged_eq_system.py','w')
        for i in a[:7]: f.write(i) # write the first always equal lines
        for eq,eq_name in zip(a[7:-1], core_species_list): # the equation part, to be modified in the following
            new_eq = eq.replace(',','') #  get rid of the end of line semi-colon
            new_eq=new_eq.strip() # and leading, trailing whitespaces, tabs or newlines
            if eq_name in core_add_equations:
                new_eq = new_eq+convert_equation(core_add_equations[eq_name]) # add reactions to core_species if user specified
            for modifier in global_eq_modifiers:
                if modifier in new_eq:  # if the modifier is in the equation
                    if modifier in _m.parameter_names.values(): # if global system modifier is specified
                        pid = [pid for pid, pname in _m.parameter_names.items() if pname == modifier][0] # get id of parameter that has been specified to be a global modifier
                        if _m.rules and pid in _m.rules:
                            global_eq_modifier = _m.rules[pid] # if it is a rule, replace by rule equation
                            # print global_eq_modifier, '1'
                            for i in range(5): # check 5 levels deep if there are parameters that need to be replaced by rules
                                for rule_key in _m.rules:
                                    m1 = re.compile(r'%s$'%(rule_key)) # at the end of the string
                                    m2 = re.compile(r'%s(?=\W)'%(rule_key)) # not followed by another digit
                                    global_eq_modifier = m1.sub(_m.rules[rule_key],global_eq_modifier)
                                    global_eq_modifier = m2.sub('( '+_m.rules[rule_key]+' )',global_eq_modifier)
                            global_eq_modifier = convert_equation(global_eq_modifier)
                        else:
                            global_eq_modifier = _m.parameter_values[pid] # if not a rule, set to parameter value
                    else:
                        global_eq_modifier = 1.0 # or if not specified, set to 1
                    new_eq = new_eq.replace(modifier,str(global_eq_modifier))
            f.write('    '+new_eq+',\n') # write the modified equation with semi-colon and newline
        # and now append the new equation for user species as specified in SBML file:
        for index,species in enumerate(_m.species):
            new_diff_equation = _m.diff_equations[species]
            new_diff_equation = convert_equation(new_diff_equation)
            new_diff_equation= new_diff_equation.strip() # get rid of leading and trailing \n\t oder ' '
            if index == len(_m.species)-1:
                f.write('    %s\n'%new_diff_equation)
            else:
                f.write('    %s,\n'%new_diff_equation)
        f.write('    ])')
        f.close()
        return None

#Y[0]=mCLN, Y[1]=Cln, Y[2]=B_R, Y[3]=B_Am, Y[4]=B_Ad, Y[5]=mB_R, Y[6]=mB_A, Y[7]=mCLB, Y[8]=Clb
#p[0]=k_d1, p[1]=k_p1, p[2]=k_d2, p[3]=k_R, p[4]=k_Am, p[5]=k_Ad, p[6]=growth, p[7]=A_t, p[8]=V_t, p[9]=k_d3, p[10]=k_p2, p[11]=k_d4
#k_d1 = destruction rate of mCLN
#k_p1 = production rate of Cln
#k_d2 = destruction rate of Cln
#k_d3 = destruction rate of mCLB
#k_p2 = production rate of Clb
#k_d4 = destruction rate of Clb
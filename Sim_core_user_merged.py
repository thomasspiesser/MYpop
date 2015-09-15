#!/usr/bin/python
# -*- coding: iso-8859-1 -*-

#Import modules
from numpy import * 
# import random as rd
from scipy import integrate
import sys, re, math
import merged_eq_system
from MYpop_functions import process_condition, check_free, initiate_core_cell, find_and_replace

def Sim_core_user_merged(user_model, matrix_dim, initial_cell_nr, events, G1_details, S_details, G2_details, M_details, parameter_values, precision,print_phase=False):
  t = 0          # time point zero
  if precision=='low':
    tol=0.01
  elif precision=='middle':
    tol=0.0001
  elif precision=='high':
    tol=1.49012e-8

  my_model_species = ['mCLN','Cln','B_R','B_Am','B_Ad','mB_R','mB_A','mCLB','Clb']
  my_species_init_cond = dict([('mCLN',0),('Cln',0),('B_R',25),('B_Am',8.5),('B_Ad',0),('mB_R',1),('mB_A',1),('mCLB',0),('Clb',0)])
  my_species_init_cond.update(user_model.species_values)

  my_cell = [('field',int),('generation',int),('t_in_G1',int),('t_in_S',int),('t_in_G2',int),('t_in_M',int),('times_in_G1',list),('times_in_S',list),('times_in_G2',list),('times_in_M',list),('V_div',list),('V',list),('ratios',list),('V0',list)] + [(i, list) for i in my_model_species] + [(i, list) for i in user_model.species]
  
  culture = zeros((matrix_dim,matrix_dim), dtype=my_cell)  # initiate virtual culture grid (n*m fields)

  ############################################################

  # initiate new cells, start population:
  for i in range(initial_cell_nr):
    culture = initiate_core_cell(culture, my_species_init_cond)

  ############################################################

  individuals = []
  core_parameters = ['k_d1', 'k_p1', 'k_d2', 'k_R_G1', 'k_R_SG2M', 'k_Am_G1', 'k_Am_SG2M', 'k_Ad_G1', 'k_Ad_SG2M', 'growth', 'k_d3', 'k_p2', 'k_d4']
  # core_parameter_values = dict(k_d1 = 0.1, k_p1 = 0.35, k_d2 = 0.1, k_R_G1 = 4.75, k_R_SG2M = 2, k_Am_G1 = 1, k_Am_SG2M = 0, k_Ad_G1 = 0, k_Ad_SG2M = 1, growth=0.02, k_d3 = 0.1, k_p2 = 0.25, k_d4 = 0.1)
  core_parameter_values=parameter_values.copy()
  parameter_restore_per_event = []

  ############################################################
  #clean events (para_ids instead of names and put values in dict para_restore to restore to original value of event)
  for i, event in enumerate(events):
    parameter_restore = dict()
    e_trigger, e_vars = event
    for my_p in core_parameters:
        if re.search(r'%s(?=\W|$)'%(my_p),e_vars):
            parameter_restore[my_p] = core_parameter_values[my_p]
    for pid, pname in user_model.parameter_names.items():
        if re.search(r'%s(?=\W|$)'%(pname),e_vars):
            events[i][1] = find_and_replace(pattern=pname, dest_str=events[i][1], repl_str=pid)
            parameter_restore[pid] = user_model.parameter_values[pid]
    print parameter_restore, ': par restore', i
    parameter_restore_per_event.append(parameter_restore)
  print parameter_restore_per_event, ': per event'

  ############################################################

  G1_condition = process_condition(G1_details, user_model.species+my_model_species, user_model.species_names)
  S_condition = process_condition(S_details, user_model.species+my_model_species, user_model.species_names)
  G2_condition = process_condition(G2_details, user_model.species+my_model_species, user_model.species_names)
  M_condition = process_condition(M_details, user_model.species+my_model_species, user_model.species_names)

  flags = [False] * len(events) # flags default to False for every event
  while True:
    cells = culture['field']==1
    i_s,j_s = nonzero(cells)
    #global events:
    for i, event in enumerate(events):
        e_trigger, e_vars = event
        e_target, e_expr = e_vars.split('=')
        e_target = e_target.strip()
        e_expr = e_expr.strip()
        if eval(e_trigger, {'t':t,"__builtins__": None}) and not flags[i]: # {"__builtins__": {}} protects from attacks in eval of unknown expressions
            z0 = core_parameter_values.copy() # namespace for eval dict(my_paras, user_paras, security_thingi)
            z0.update(user_model.parameter_values)
            z0.update({"__builtins__": None})
            z0.update(vars(math)) # so all math.functions are allowed, like pi or sin()
            if e_target in core_parameters:
                core_parameter_values[e_target] = eval(e_expr, z0 )
            elif e_target in user_model.parameters:
                user_model.parameter_values[e_target] = eval(e_expr, z0 )
            flags[i] = True
        elif not eval(e_trigger, {'t':t,"__builtins__": None}) and flags[i]: # reset the values to original ones
            if e_target in core_parameters:
                core_parameter_values[e_target] = parameter_restore_per_event[i][e_target]
            elif e_target in user_model.parameters:
                user_model.parameter_values[e_target] = parameter_restore_per_event[i][e_target]
            flags[i] = False

    for i,j in zip(i_s,j_s):
      if (eval(G1_condition, {'culture':culture, 'i':i, 'j':j, "__builtins__": None}) and culture[i,j]['t_in_S']<1 and culture[i,j]['t_in_G2']<1 and culture[i,j]['t_in_M']<1):
        # G1-phase
        if print_phase: print 'G1'

        V_t=culture[i,j]['V'][-1]
        A_t=culture[i,j]['B_Am'][-1] + culture[i,j]['B_Ad'][-1] # current Area
        
        ## save V0 data
        if culture[i,j]['t_in_G1'] == 0:
          culture[i,j]['V0'].append(V_t)

        #stochastic transcription: # one promoter
        transcription = random.sample()
        if transcription > core_parameter_values['P_Cln']:    mCLN_burst = 0.
        else:   mCLN_burst = 1
    
        # setup integration input:
        Y0=array([culture[i,j][my_species][-1] for my_species in my_model_species] + [ culture[i,j][species][-1] for species in user_model.species])
        Y0[0] = Y0[0]+mCLN_burst # add transcript
        t_step = linspace(t,t+1,2)
        p=array([core_parameter_values[para] for para in ['k_d1','k_p1','k_d2','k_R_G1','k_Am_G1','k_Ad_G1','growth','k_d3','k_p2','k_d4']] + [A_t, V_t] + [user_model.parameter_values[p] for p in user_model.parameters])

        # integration:
        Y = integrate.odeint(merged_eq_system.dY_dt, Y0, t_step,(p,),rtol=tol,atol=tol) # hard coded equations from SBML file and scipy's odeint
        # Y,out = integrate.odeint(merged_eq_system.dY_dt, Y0, t_step,(p,),full_output=1) # hard coded equations from SBML file and scipy's odeint
        # print out
        # if out['message']=='Integration successful.':
        #   pass
        # else:
          # print Y0
          # print p
          # print Y
          # print out
          # sys.exit(1)
    
        #save results
        Y = Y.T
        for index, my_species in enumerate(my_model_species):
            culture[i,j][my_species].append(Y[index][-1])
        for index2, species in enumerate(user_model.species):
            culture[i,j][species].append(Y[1+index+index2][-1])

        culture[i,j]['V'].append(culture[i,j]['B_Am'][-1]**1.5 + culture[i,j]['B_Ad'][-1]**1.5)
        culture[i,j]['t_in_G1']+=1

      elif (eval(S_condition, {'culture':culture, 'i':i, 'j':j, "__builtins__": None}) and culture[i,j]['t_in_G2']<1 and culture[i,j]['t_in_M']<1):
        # now S-phase:
        if print_phase: print 'S'
    
        if culture[i,j]['t_in_S']==0:  # first S entry save time in G1
          culture[i,j]['times_in_G1'].append(culture[i,j]['t_in_G1'])
       
        # setup integration input:
        Y0=array([culture[i,j][my_species][-1] for my_species in my_model_species] + [ culture[i,j][species][-1] for species in user_model.species])   
        t_step = linspace(t,t+1,2)
        V_t=culture[i,j]['V'][-1]
        A_t=culture[i,j]['B_Am'][-1] + culture[i,j]['B_Ad'][-1] # current Area
        p=array([core_parameter_values[para] for para in ['k_d1','k_p1','k_d2','k_R_SG2M','k_Am_SG2M','k_Ad_SG2M','growth','k_d3','k_p2','k_d4']] + [A_t, V_t] + [user_model.parameter_values[p] for p in user_model.parameters])

        # integration:
        Y = integrate.odeint(merged_eq_system.dY_dt, Y0, t_step,(p,),rtol=tol,atol=tol) # hard coded equations from SBML file and scipy's odeint
    
        #save results
        Y=Y.T
        for index, my_species in enumerate(my_model_species):
            culture[i,j][my_species].append(Y[index][-1])
        for index2, species in enumerate(user_model.species):
            culture[i,j][species].append(Y[1+index+index2][-1])

        culture[i,j]['V'].append(culture[i,j]['B_Am'][-1]**1.5 + culture[i,j]['B_Ad'][-1]**1.5)
        culture[i,j]['t_in_S']+=1

      elif (eval(G2_condition, {'culture':culture, 'i':i, 'j':j, "__builtins__": None}) and culture[i,j]['t_in_M']<1): 
        # now G2-phase:
        if print_phase: print 'G2'
    
        if culture[i,j]['t_in_G2']==0: # first S entry save time in G1
          culture[i,j]['times_in_S'].append(culture[i,j]['t_in_S'])

        #stochastic transcription: # one promoter
        transcription = random.sample()
        if transcription > core_parameter_values['P_Clb']:    mCLB_burst = 0.
        else:   mCLB_burst = 1
       
        # setup integration input:
        Y0=array([culture[i,j][my_species][-1] for my_species in my_model_species] + [ culture[i,j][species][-1] for species in user_model.species])
        Y0[7] = Y0[7]+mCLB_burst # add transcript
        t_step = linspace(t,t+1,2)
        V_t=culture[i,j]['V'][-1]
        A_t=culture[i,j]['B_Am'][-1] + culture[i,j]['B_Ad'][-1] # current Area
        p=array([core_parameter_values[para] for para in ['k_d1','k_p1','k_d2','k_R_SG2M','k_Am_SG2M','k_Ad_SG2M','growth','k_d3','k_p2','k_d4']] + [A_t, V_t] + [user_model.parameter_values[p] for p in user_model.parameters])

        # integration:
        Y = integrate.odeint(merged_eq_system.dY_dt, Y0, t_step,(p,),rtol=tol,atol=tol) # hard coded equations from SBML file and scipy's odeint

        # print Y
    
        #save results
        Y=Y.T
        for index, my_species in enumerate(my_model_species):
            culture[i,j][my_species].append(Y[index][-1])
        for index2, species in enumerate(user_model.species):
            culture[i,j][species].append(Y[1+index+index2][-1])

        culture[i,j]['V'].append(culture[i,j]['B_Am'][-1]**1.5 + culture[i,j]['B_Ad'][-1]**1.5)
        culture[i,j]['t_in_G2']+=1

      elif (eval(M_condition, {'culture':culture, 'i':i, 'j':j, "__builtins__": None})): 
        # now M-phase:
        if print_phase: print 'M'
        
        if culture[i,j]['t_in_M']== 0: # first S entry save time in G1 and the geneological age
          culture[i,j]['times_in_G2'].append(culture[i,j]['t_in_G2'])
       
        # setup integration input:
        Y0 = array([ culture[i,j][my_species][-1] for my_species in my_model_species] + [ culture[i,j][species][-1] for species in user_model.species])
        t_step = linspace(t,t+1,2)
        V_t=culture[i,j]['V'][-1]
        A_t=culture[i,j]['B_Am'][-1] + culture[i,j]['B_Ad'][-1] # current Area
        p= array([core_parameter_values[para] for para in ['k_d1','k_p1','k_d2','k_R_SG2M','k_Am_SG2M','k_Ad_SG2M','growth','k_d3','k_p2','k_d4']] + [A_t, V_t] + [user_model.parameter_values[p] for p in user_model.parameters])

        # integration:
        Y = integrate.odeint(merged_eq_system.dY_dt, Y0, t_step,(p,),rtol=tol,atol=tol) # hard coded equations from SBML file and scipy's odeint

        #save results
        Y=Y.T
        for index, my_species in enumerate(my_model_species):
            culture[i,j][my_species].append(Y[index][-1])
        for index2, species in enumerate(user_model.species):
            culture[i,j][species].append(Y[1+index+index2][-1])

        culture[i,j]['V'].append(culture[i,j]['B_Am'][-1]**1.5 + culture[i,j]['B_Ad'][-1]**1.5)
        culture[i,j]['t_in_M']+=1
    
      else:
        if print_phase: print 'division'
        culture[i,j]['times_in_M'].append(culture[i,j]['t_in_M']) # save time in M
        #ready to divide..then let's check if there is enough space around
        n_ij = check_free(culture)
        # n_ij = 1
        if n_ij: # if there is space: divide
          m_d=culture[i,j]['B_Am'][-1]**1.5/culture[i,j]['V'][-1] # division ratio mum: Area_m^2/3 / ( Area_m^2/3 + Area_d^2/3 )
          d_d=1-m_d # division ratio daughter
          culture[i,j]['V_div'].append(culture[i,j]['V'][-1]) # stats: add [V] at division to list
          culture[i,j]['ratios'].append(d_d) # stats: add fraction given to daughter at division to list

          d_species_init_cond = my_species_init_cond.copy() # update initial cond for new daughter
          for partition_species in ['mCLN','Cln','B_R','mCLB','Clb']+user_model.species:
            d_species_init_cond[partition_species] = culture[i,j][partition_species][-1] * d_d
            culture[i,j][partition_species].append(culture[i,j][partition_species][-1] * m_d) # update mommy species values accounting for loss to daughter

          d_species_init_cond['B_Am'] = culture[i,j]['B_Ad'][-1] # new daughter has size of mummies bud
          d_species_init_cond['B_Ad'] = 0 # and daughter does not have a bud yet
      
          culture[i,j]['B_Am'].append(culture[i,j]['B_Am'][-1])# mummy can grow a new daughter now, need to append here, or else this list is one value short every division
          culture[i,j]['B_Ad'].append(0)# mummy can grow a new daughter now
          culture[i,j]['V'].append(culture[i,j]['B_Am'][-1]**1.5) # update the volume of the mum

          culture[i,j]['t_in_G1']=0 # reset mummy time in G1
          culture[i,j]['t_in_S'] = 0 # mummy can enter S again
          culture[i,j]['t_in_G2'] = 0  # reset mummy time in G2
          culture[i,j]['t_in_M'] = 0 # mummy can enter M again

          culture[i,j]['generation'] += 1 # update no. of generations mother

          culture = initiate_core_cell(culture, d_species_init_cond) # new daughter with attributes inherited from mother

    d= culture['field']==0
    individuals.append(len([value for position, value in ndenumerate(d) if not value]))

    t += 1
    # if individuals: print individuals[-1], t
    if individuals[-1] >= matrix_dim**2: break
    # if individuals[-1] >= 2: break
    # if t >= 1000:
    #   print 'time_break',individuals
    #   break
   
  ################# round all to 2 after komma and return culture ####################

  attrs = ['V_div','V','ratios','times_in_G1','times_in_G2','times_in_S','times_in_M','V0'] + my_model_species + user_model.species
  for X in attrs:
    for index,cell in enumerate(culture[X].flat):
      if cell: culture[X].flat[index]=list([[round(x,2), x][x<0.02] for x in cell])
  return culture

#!/usr/bin/python
# -*- coding: iso-8859-1 -*-

import libsbml, sys, re, numpy

def clean_formula(formula):
    for s in ['(',')','*','/','+','-',',']:
        formula = formula.replace(s,' %s '%s)
    for i in range(3): formula = formula.replace("  "," ")
    match = re.search(r'\de - ',formula) # e.g. 10e-05 cannot be 10e - 05
    if match:
        my_digit = match.group(0)[0]
        formula = formula.replace(match.group(0),my_digit+'e-')
    split_formula = formula.split(' ')
    n_split_formula = []
    for i in split_formula:
        try:
            i = float(i) # try to convert '1' to '1.0'
            i = str(i)
            n_split_formula.append(i)
        except:
            n_split_formula.append(i)
    formula = ' '.join(n_split_formula)
    return formula


def find_and_replace(pattern, dest_str, repl_str):
    re_comp = re.compile(r'%s(?=\W|$)'%(pattern)) # not followed by alphanumeric [a-zA-Z0-9_] or (|) is at end of string ($)
    return re_comp.sub(repl_str, dest_str) # substitute pattern with repl_str in dest_str if found


class my_model:
    """class for sbml model import """
    def __init__(self, filename):
        self._m = self._import_model_from_file(filename) # the sbml model instance
        self.species_values, self.species, self.species_names = self._get_species()
        self.parameter_values, self.parameters, self.parameter_names = self._get_parameters()

        self.rule_list = [rule.getId() for rule in self._m.getListOfRules()]
        self.rules = dict([(rule.getId(), clean_formula( rule.getFormula() ) ) for rule in self._m.getListOfRules()])
        
        # if a species is just an assignment/rule, then don't keep it as species in list
        if self.rules:
            for i in self.rules:
                if i in self.species:
                    self.species.remove(i)

        self.event_ass_lists = [event.getListOfEventAssignments() for event in self._m.getListOfEvents()]
        self.events = dict([ (event.getId(),event) for event in self._m.getListOfEvents()])
        # print self.events
        # for event in self.event_ass_lists[0]:
        #   print event.getVariable()
        #   print libsbml.formulaToString(event.getMath())
        # self.event_triggers = [event.getTrigger().getMath() for event in self._m.getListOfEvents()]
        # print libsbml.formulaToString(self.event_triggers[0])
        # sys.exit(1)
        self.reaction_list = [reaction.getId() for reaction in self._m.getListOfReactions()]
        self.reaction_names = dict([(reaction.getId(),reaction.getName()) for reaction in self._m.getListOfReactions()])
        self.reactions = dict([(reaction.getId(), clean_formula( reaction.getKineticLaw().getFormula() ) ) for reaction in self._m.getListOfReactions()]) # dict of reaction ids, formulas still with functions in it
        self.kinetic_laws = dict([(reaction.getId(),reaction.getKineticLaw()) for reaction in self._m.getListOfReactions()]) # dict of reaction ids, kinetic law objects

        for reaction_id in self.reactions:
            self.reactions[reaction_id] = self.function_definition_replace(self.reactions[reaction_id],self.kinetic_laws[reaction_id]) # replace functions with function formulas
            self.reactions[reaction_id] = self.parameter_replace(reaction_id,self.reactions[reaction_id]) # replace local parameter names in formulas with unique names
            if self.rules:
                self.reactions[reaction_id] = self.rules_replace(reaction_id,self.reactions[reaction_id]) # replace rules in formulas with rule formulas

        self._species2pos = dict( zip(self.species, range(self.species.__len__() ) ) ) # species_1: 0, species_2: 1.
        self.N = self._get_stoich_mat() # build stoichiometric matrix
        self.diff_equations = self.get_diff_equations()

    def rules_replace(self,reaction_id,reaction_formula):
        # replace rules in formulas with rule expressions
        formula = reaction_formula
        for i in range(5): # do this 5 levels deep
            for rule in self._m.getListOfRules():
                var = rule.getVariable()
                formula = find_and_replace(var, formula, '( ' + rule.getFormula() + ' )')
        formula = clean_formula(formula)
        return formula

    def parameter_replace(self,reaction_id,reaction_formula):
        # replace parameter names in formulas with unique names
        formula = reaction_formula
        for i in self.parameters:
            try:
                rct, p = i.split('__')
                if reaction_id == rct:
                    formula = find_and_replace(p, formula, i)
            except:
                pass
        return formula

    def get_diff_equations(self):
        """ get the differential equations in dict with species names as keys and the diff eqs as strings """
        self.diff_equations = dict([(i,'') for i in self.species])
        for s in self._m.getListOfSpecies():
            # if s.getConstant() or s.getBoundaryCondition():
            if s.getConstant():
                self.diff_equations[s.getId()] = '0' # constant species will have 0 - no change over time - on the right hand side of the diff_equation
        for j,r in enumerate( self._m.getListOfReactions() ):
            modes = [('-','Reactants'), ('+','Products')]
            for sign,direction in modes:
                for sr in getattr(r,'getListOf'+direction)():
                    s=self._m.getSpecies(sr.getSpecies())
                    if s.getBoundaryCondition() or s.getConstant(): # right hand side of const species remain 0
                        continue
                    self.diff_equations[sr.getSpecies()] = self.diff_equations[sr.getSpecies()] + ' ' + sign + ' ' + str(sr.getStoichiometry()) + ' * (' + self.reactions[r.getId()]+ ' ) '
                    self.diff_equations[sr.getSpecies()] = clean_formula(self.diff_equations[sr.getSpecies()])
                    self.diff_equations[sr.getSpecies()] = self.diff_equations[sr.getSpecies()].strip() # get rid of whitespace leading and lagging
        for s,eq in self.diff_equations.items():  # for empty species
            if eq == '':
                self.diff_equations[s] = '0'
        return self.diff_equations

    def _get_stoich_mat(self):
        """ get the stoichiometric matrix (including constant and boundary condition species) 
        constant and boundary condition species rows are zeros """
        N = numpy.zeros( (len(self.species),self._m.getNumReactions()) )
        for i,r in enumerate( self._m.getListOfReactions() ):
            modes = [(-1,'Reactants'), (+1,'Products')]
            for sign,direction in modes:
                for sr in getattr(r,'getListOf'+direction)():
                    s=self._m.getSpecies(sr.getSpecies())
                    if s.getBoundaryCondition() or s.getConstant(): # keep entry 0 for const./boundery species, although in/outflux might be specified 
                        continue
                    j=self._species2pos[sr.getSpecies()]
                    N[j,i] = sign*sr.getStoichiometry()
        return N

    def function_definition_replace( self,formula,kinetic_law ):
        """ Replace the function definitions in the formulas with the actual formulas. Replace also parameters in function definitions with actual parameters. """
        for fd in self._m.getListOfFunctionDefinitions():
            children = [kinetic_law.getMath().getChild(x) for x in range(kinetic_law.getMath().getNumChildren())]
            for child in children:
                if fd.getId() == child.getName(): # if the function is in the formula
                    arg_list = [child.getChild(y).getName() for y in range(child.getNumChildren())] # list of function arguments
                    var_list = dict( zip ([fd.getArgument(x).getName() for x in range(fd.getNumArguments())], arg_list)) # dict of function variables as keys, function arguments as values 
                    matchstring = "\s*"+fd.getId()+"\s*\("+ ",".join([".*"]*len(var_list)) +"\)\s*"
                    match = re.search(matchstring,formula)
                    fd_formula = ' ' + libsbml.formulaToString(fd.getBody()) + ' ' # clean formula a bit
                    fd_formula = clean_formula(fd_formula) # clean formula a bit
                    for arg in var_list: # replace variables with arguments in new formulas
                        fd_formula = find_and_replace(' '+arg, fd_formula, ' '+var_list[arg])
                    formula = formula.replace(match.group(0), fd_formula) # replace the function with function_definition
        return formula

    def _import_model_from_file(self,filename):
        """read the sbml file (check for errors) and return the model instance"""
        reader = libsbml.SBMLReader()
        self._document = reader.readSBML(filename)
        if self._document.getNumErrors():
            self._document.printErrors()
            return None
        else:
            self._m = self._document.getModel()
        return self._m

    def _get_parameters(self):
        """ get dictionary of parameter values and compartmets - """
        self.parameter_values = {}
        self.parameter_names = {}
        self.parameters = []
        # get all the global (in model) and local (in reactions) parameters 
        for p in self._m.getListOfParameters(): # global parameters
            self.parameters.append( p.getId() )
            self.parameter_names[p.getId()] = p.getName()
            self.parameter_values[p.getId()] = p.getValue() 
        for reaction in self._m.getListOfReactions(): # local parameters (assign new name)
            rname = reaction.getId()
            # rformula = reaction.getKineticLaw().getFormula()
            for p in reaction.getKineticLaw().getListOfParameters():
                newname = rname+"__"+p.getId()
                self.parameter_names[newname] = p.getName()
                self.parameter_values[newname] = p.getValue()
                self.parameters.append( newname )
        for compartment in self._m.getListOfCompartments(): # compartments
            self.parameter_values[ compartment.getId() ] = compartment.getSize()
            self.parameter_names[ compartment.getId() ] = compartment.getName()
            self.parameters.append( compartment.getId() )
        return self.parameter_values, self.parameters, self.parameter_names

    def _get_species(self):
        """get all species in the model"""
        self.species = []
        self.species_values = {}
        self.species_names = {}
        for sbmlspecies in self._m.getListOfSpecies():
            self.species_names[ sbmlspecies.getId() ] = sbmlspecies.getName()
            self.species_values[ sbmlspecies.getId() ] = sbmlspecies.getInitialConcentration()
            self.species.append( sbmlspecies.getId() )
        return self.species_values, self.species, self.species_names
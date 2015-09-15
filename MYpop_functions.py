#!/usr/bin/python
# -*- coding: iso-8859-1 -*-

#Import modules
from numpy import * 
import re
import random as rd

def find_and_replace(pattern, dest_str, repl_str):
  re_comp = re.compile(r'%s(?=\W|$)'%(pattern)) # not followed by alphanumeric [a-zA-Z0-9_] or (|) is at end of string ($)
  return re_comp.sub(repl_str, dest_str) # substitute pattern with repl_str in dest_str if found

def process_condition(condition_str,model_species,model_species_names):
  # model_species is list of species_ids, core_species and species_names
  for s_id, s_name in model_species_names.items():
    condition_str = find_and_replace(pattern=s_name, dest_str=condition_str, repl_str=s_id) # clean str with ids instead of names
  for species in model_species:
    condition_str = find_and_replace(pattern=species, dest_str=condition_str, repl_str='culture[i,j][\'%s\'][-1]'%(species))
  if 'length' in condition_str:
    phases=['G1','S','G2','M']
    for phase in phases:
      if phase in condition_str:
        condition_str = condition_str.replace(' ','')
        condition_str = condition_str.replace(phase+'_length=','culture[i,j][\'t_in_%s\']<'%(phase))
  return condition_str

def check_free(culture):
  '''check if there is still space anywhere on the array.'''
  d = culture['field'] == 0  # array with True where field is free
  if (d.any()):
    empty = rd.sample([position for position, value in ndenumerate(d) if value], 1)  # random free position
    return empty[0]

def initiate_cell(culture, my_species_init_cond):
  n_ij = check_free(culture)
  if (n_ij): # if there is space init cell
    n_i,n_j = n_ij
    culture[n_i,n_j]['field']   = 1  # init first cell
    culture[n_i,n_j]['generation']  = 0  # generation 0
    culture[n_i,n_j]['t_in_G1']   = 0  # age in t  
    culture[n_i,n_j]['V_div']   = []
    culture[n_i,n_j]['ratios']  = []
    culture[n_i,n_j]['S_entry']   = 0
    culture[n_i,n_j]['times_in_G1']   = []
    culture[n_i,n_j]['V0']    = []
    for my_species in my_species_init_cond:
        culture[n_i,n_j][my_species] = [my_species_init_cond[my_species]]
    culture[n_i,n_j]['V'] = [culture[n_i,n_j]['B_Am'][-1]**1.5+culture[n_i,n_j]['B_Ad'][-1]**1.5]
  return culture

def initiate_core_cell(culture, my_species_init_cond):
  n_ij = check_free(culture)
  if (n_ij): # if there is space init cell
    n_i,n_j = n_ij
    culture[n_i,n_j]['field']   = 1  # init first cell
    culture[n_i,n_j]['generation']  = 0  # generation 0
    culture[n_i,n_j]['t_in_G1']   = 0 
    culture[n_i,n_j]['t_in_S']   = 0 
    culture[n_i,n_j]['t_in_G2']   = 0 
    culture[n_i,n_j]['t_in_M']   = 0   
    culture[n_i,n_j]['V_div']   = []
    culture[n_i,n_j]['ratios']  = []
    culture[n_i,n_j]['times_in_G1']   = []
    culture[n_i,n_j]['times_in_S']   = []
    culture[n_i,n_j]['times_in_G2']   = []
    culture[n_i,n_j]['times_in_M']   = []
    culture[n_i,n_j]['V0']    = []
    for my_species in my_species_init_cond:
        culture[n_i,n_j][my_species] = [my_species_init_cond[my_species]]
    culture[n_i,n_j]['V'] = [culture[n_i,n_j]['B_Am'][-1]**1.5+culture[n_i,n_j]['B_Ad'][-1]**1.5]
  return culture
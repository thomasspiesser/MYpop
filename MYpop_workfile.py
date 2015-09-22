#!/usr/bin/python
# -*- coding: iso-8859-1 -*-

import SBML_importer, model_builder, sys

from scipy import integrate
from numpy import *
import cPickle
import MYpop_plots as pl

############ test SBML_importer separately #########
# sbml_file = 'example_models/model2_6_species.xml'
# user_model = SBML_importer.my_model(sbml_file)
# print user_model.diff_equations
# print user_model.rules
# print user_model.species_names
# print user_model.parameter_names
# sys.exit(1)

############ test simulation #########
######### load model and setup objects:

sbml_file = 'example_models/osmo_stress_model.xml' # osmo-shock model
# sbml_file = 'example_models/model2_6_species.xml' # path to model file
local_path = '' # in case you wanna work somewhere else
user_model = SBML_importer.my_model(sbml_file)
class_object = model_builder.model_builder(user_model, local_path, T_END=1) # instantiate
class_object.build_merged_eq_sys(user_model, local_path)  # build merged_eq_system.py file (core and user sbml model); write to local_path

from Sim_core_user_merged import Sim_core_user_merged # only import after merged_eq_system was built

#### osmo-shock with core
ev=[['t>=750','osmoe=osmoe+2*NaCl_conc']]
g1d = 'Cln < 150'
sd =  'S_length = 25'
g2d =  'Clb < 150'
md = 'M_length = 5'

pv={'k_d2': 0.1, 'k_R_G1': 4.02, 'k_R_SG2M': 1.21, 'k_Ad_G1': 0.0, 'k_Am_G1': 1.0, 'k_Am_SG2M': 0.0, 'k_p1': 0.59, 'k_p2': 1.61, 'k_d1': 0.1, 'k_d3': 0.1, 'k_d4': 0.1, 'growth': 0.06, 'k_Ad_SG2M': 1.0, 'P_Cln': 0.4, 'P_Clb': 0.4}
pre = 'low'

culture = Sim_core_user_merged(user_model=user_model, matrix_dim=2, initial_cell_nr=1, events=ev, G1_details=g1d, S_details=sd, G2_details=g2d, M_details=md, parameter_values=pv, precision=pre) # osmo-model

cPickle.dump( culture, open( "population_w_osmo_shock.p", "w" ) ) # dump results in file
sys.exit(1)

### test multiple events ###
# ev=[['t>=2 and t<9','osmoe = osmoe + 2 * NaCl_conc'], ['t>=4 and t<7','osmoe = osmoe + 2 * NaCl_conc']]
# print ev, ': event from outside'

# g1d = 'Cln < 150'
# sd =  'S_length = 25'
# g2d =  'Clb < 50'
# md = 'M_length = 5'
# pv={'k_d2': 0.1, 'k_R_G1': 4.52, 'k_R_SG2M': 2.67, 'k_Ad_G1': 0.0, 'k_Am_G1': 1.0, 'k_Am_SG2M': 0.0, 'k_p1': 0.34, 'k_p2': 0.4, 'k_d1': 0.1, 'k_d3': 0.1, 'k_d4': 0.1, 'growth': 0.04, 'k_Ad_SG2M': 1.0, 'P_Cln': 0.4, 'P_Clb': 0.4}
# pre = 'low'
# culture = Sim_core_user_merged(user_model=user_model, matrix_dim=2, initial_cell_nr=2, events=ev, G1_details=g1d, S_details=sd, G2_details=g2d, M_details=md, parameter_values=pv, precision=pre) # osmo-model

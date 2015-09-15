#!/usr/bin/python
# -*- coding: iso-8859-1 -*-

from numpy import array

def dY_dt(Y,t,p):
  return array([
		(- p[0] * Y[0]) * ( k__mCLN ),
		(p[10] * p[1] * Y[0]/p[11] * Y[2]) * ( k__Cln_plus ) - (p[2] * Y[1]) * ( k__Cln_minus ),
		(p[6] * p[10] * Y[5]/p[11] * (p[3]/(p[3]+p[4]+p[5])) * Y[2]) * ( k__B_R ),
		(p[6] * p[10] * Y[6]/p[11] * (p[4]/(p[3]+p[4]+p[5])) * Y[2]) * ( k__B_Am ),
		(p[6] * p[10] * Y[6]/p[11] * (p[5]/(p[3]+p[4]+p[5])) * Y[2]) * ( k__B_Ad ),
		(0) * ( k__mB_R ),
		(0) * ( k__mB_A ),
		(- p[7] * Y[7]) * ( k__mCLB ),
		((p[10] * p[8] * Y[7]/p[11] * Y[2]) * (Y[4]**1.5/(Y[4]**1.5 + Y[3]**1.5))) * ( k__Clb_plus ) - (p[9] * Y[8]) * ( k__Clb_minus )
		])
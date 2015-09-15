#!/usr/bin/python
# -*- coding: iso-8859-1 -*-

import pylab as p
from numpy import * 
from scipy import stats,polyval
import sys
import re
from mpl_toolkits.mplot3d import Axes3D
from matplotlib import rc,cm
import mpl_toolkits.mplot3d.art3d as art3d
from matplotlib.patches import PathPatch


################ plot percentage of each generation of whole population ##################

def plot_percentage_gen(array_v,save_name):
  d= array_v['field']==0
  individuals=float(len([value for position, value in ndenumerate(d) if not value]))

  max_generation = array_v['generation'].max()
  
  f1 = p.figure()
  ax = f1.add_subplot(111)
  # ax.set_yscale('log')
  liste = []
  for i in range(max_generation+1):
    tmp_gen = array([array_v[position]['generation'] for position, value in ndenumerate(array_v['field']) if value])
    tmp_gen = (len([value for position, value in ndenumerate(tmp_gen) if value==i]))
    tmp_percentage = tmp_gen/individuals
    liste.append(tmp_percentage)
  
  a1=p.bar(range(max_generation+1),liste,width=0.4,color='#82bcd3')

  a2=p.bar(arange(max_generation+1)+0.4,[0.5**i for i in range(1,max_generation+2)],width=0.4,color='#005d37')
  
  p.ylabel('Fraction')

  p.xlabel('Genealogical age')
  p.xticks(arange(max_generation)+0.4,(range(max_generation))) 
  p.legend((a1[0],a2[0]),('Simulation','Theoretical'))

  p.ylim(0.0001,1)
  f1.savefig(save_name)
  f1.savefig(save_name.replace('pdf','png'))
  
  # and export data as txt file
  save_name=save_name.replace('pdf','txt')
  f=open(save_name,'w')
  for i,j,k in zip(range(max_generation+1),liste,[0.5**i for i in range(1,max_generation+2)]):
    f.write('%s,%s,%s\n'%(i,j,k)) # csv file with time, mean, sd
  f.close()

################ plot fraction of V mother retains at bud event over genealogical age ##################

def plot_frac_V_gen(array_v,save_name):
  f1 = p.figure(figsize=(8, 4))

  tmp_mn=[]
  tmp_sd=[]
  zahl = max([len(i) for i in array_v['V'].flat if i]) # longest list of X values
  nr_cells=array_v.size
  tmp=zeros((nr_cells,zahl),dtype=float)

  for k1, vector in enumerate(array_v.flat):
    if vector['ratios']:
      for k2, v in enumerate(vector['ratios']):
        tmp[k1,k2] = 1-v

  for m in range(zahl):
    tmp_list=[n for n in tmp[:,m] if n!=0]
    tmp_mn.append(mean(tmp_list))
    tmp_sd.append(std(tmp_list))
  
  tmp_mn=array([n for n in tmp_mn if not isnan(n)])
  tmp_sd=array(tmp_sd[:len(tmp_mn)])
  
  tmp_mn=tmp_mn[:7] # only for first 7 generations
  tmp_sd=tmp_sd[:7] # only for first 7 generations  
  x_ax=arange(len(tmp_mn))

  plt2=p.errorbar(x_ax, tmp_mn, tmp_sd, fmt='s', elinewidth=2 ,capsize=4, ms=10, mec='#82bcd3',mew=2,color='#82bcd3',ecolor='black',barsabove=True)

  p.xlim(-0.5,len(tmp_mn)-0.5)
  p.xticks(x_ax)

  p.ylabel('Division ratio')
  p.ylim(0,1)
  p.xlabel('Genealogical age')

  f1.savefig(save_name)
  f1.savefig(save_name.replace('pdf','png'))

  # and export data as txt file
  save_name=save_name.replace('pdf','txt')
  f=open(save_name,'w')
  for i,j,k in zip(x_ax, tmp_mn, tmp_sd):
    f.write('%s,%s,%s\n'%(i,j,k)) # csv file with time, mean, sd
  f.close()
  

################ plot V at division over genealogical age ##################

def plot_V_gen(array_v,save_name,logit):
  f1 = p.figure()
  ax = f1.add_subplot(111)

  tmp_mn=[]
  tmp_sd=[]
  zahl = max([len(i) for i in array_v['V'].flat if i]) # longest list of X values
  nr_cells=array_v.size
  tmp=zeros((nr_cells,zahl),dtype=float)

  for k1, vector in enumerate(array_v.flat):
    if vector['V_div']:
      for k2, v in enumerate(vector['V_div']):
        tmp[k1,k2] = v

  for m in range(zahl):
    if not logit: tmp_list=[n for n in tmp[:,m] if n!=0]
    else: tmp_list=[log10(n) for n in tmp[:,m] if n!=0]
    tmp_mn.append(mean(tmp_list))
    tmp_sd.append(std(tmp_list))
  tmp_mn=array([n for n in tmp_mn if not isnan(n)])
  tmp_sd=array(tmp_sd[:len(tmp_mn)])
  x_ax=range(len(tmp_mn))
  plt3=p.errorbar(x_ax, tmp_mn, tmp_sd, fmt='s', elinewidth=2 ,capsize=4, ms=10, mec='#82bcd3',mew=2,color='#82bcd3',ecolor='#82bcd3')

  p.xlim(-1,len(tmp_mn))
  p.xticks(range(len(tmp_mn)))

  if not logit: pass
  else: p.yticks(p.yticks()[0], [round(10**q,2) for q in p.yticks()[0]])
  p.ylabel('Mean cell volume at division (fL)')
  p.xlabel('Genealogical age')
  f1.savefig(save_name)
  f1.savefig(save_name.replace('pdf','png'))

  # and export data as txt file
  save_name=save_name.replace('pdf','txt')
  f=open(save_name,'w')
  for i,j,k in zip(x_ax, tmp_mn, tmp_sd):
    f.write('%s,%s,%s\n'%(i,j,k)) # csv file with time, mean, sd
  f.close()

################ plot times spend in G1 over genealogical age ##################

def plot_tG1_gen_new(culture,save_name,X,logit):
  # max_generation=7
  tmp_lists = []
  
  try:
    zahl = max([len(i) for i in culture[X].flat if i]) # longest list of X values
  except:
    zahl = 1
  nr_cells=culture.size
  tmp2=zeros((nr_cells,zahl),dtype=float)
  
  for k1, cell in enumerate(culture.flat):
    if cell[X]:
      for k2, x in zip(range(zahl),cell[X]):
        if X=='times_in_G1': tmp2[k1,k2] = x
        else: tmp2[k1,k2] = x+40 # coz 30mins S and 10mins M

  for m in range(zahl):
    if not logit: tmp_list=[n for n in tmp2[:,m] if n!=0]
    else: tmp_list=[log10(n) for n in tmp2[:,m] if n!=0] #log-scale
    tmp_lists.append(tmp_list)
  f1 = p.figure()
  bp=p.boxplot(tmp_lists, positions=range(len(tmp_lists)))
  
  #change colors of boxplot
  p.setp(bp['boxes'],color='#82bcd3',lw=3)
  p.setp(bp['whiskers'],color='#82bcd3',lw=3)
  p.setp(bp['caps'],color='#82bcd3',lw=3)
  p.setp(bp['fliers'],color='#82bcd3',lw=3)
  p.setp(bp['medians'],color='#25597c',lw=3)

  if logit: p.yticks(p.yticks()[0], [round(10**q,2) for q in p.yticks()[0]])

  # p.xlim(-0.5,7.5)
  p.ylabel(r'Time in %s (min)'%(X.replace('times_in_','')))
  p.xlabel('Genealogical age')
  f1.savefig(save_name)
  f1.savefig(save_name.replace('pdf','png'))

  # and export data as txt file
  save_name=save_name.replace('pdf','txt')
  f=open(save_name,'w')
  for i in tmp_lists:
    f.write('%s\n'%(i)) # csv file with time, mean, sd
  f.close()


################ plot histogramms of given distribution ##################

def plot_hist(his_data, t_s, xlab, xlim, save_name):
  f1 = p.figure()
  p.hist(his_data[1:], normed=True, label=[str(i) for i in t_s[1:]])
  p.xlabel(xlab)
  p.legend(loc='best')
  p.xlim(xlim)
  p.ylabel('relative frequency')
  f1.savefig(save_name)

################# plot lifecycle of a cell: V0 vs. Volume at division ##################

def plot_V0_vs_X(array_v, Y, xlab, ylab, save_name, int_1, int_2):
  f1 = p.figure()
  i=1
  tmp_list=[]
  for vector in array_v.flat:
    if vector['V0'] and len(vector[Y])>=int_1 and i <= int_2:
      p.plot(log(vector['V0'][0]),vector[Y][0], 'o', mec='blue', mfc='white') # plot daughters in blue
      p.plot(log(vector['V0'][1:len(vector[Y])]),vector[Y][1:], 'o', mec='red', mfc='white') # and mothers in red
      for zahl in range(len(vector[Y])):
	tmp_list.append(((vector['V0'][zahl]),vector[Y][zahl]))
      i += 1
  
  # bin the data and plot again
  tmp_list=sorted(tmp_list,key=lambda g: g[0]) # sort after first element, the V0 value
  tmp_list=array(tmp_list)
  #p.plot(tmp_list[:,0],tmp_list[:,1], 'og') # plot our original data
  maxi, mini = tmp_list[-1,0], tmp_list[0,0]
  bins=30 
  bin_edges=linspace(mini,maxi,bins+1)
  mean_values=[]
  bin_values=[]
  for i in range(bins):
    bin_values.append(((bin_edges[i+1]-bin_edges[i])/2.)+bin_edges[i])
    tmp_means=[]
    for tmp_x, tmp_y in tmp_list:
      if tmp_x >= bin_edges[i] and tmp_x <= bin_edges[i+1]: tmp_means.append(tmp_y)
    mean_values.append(mean(tmp_means))
  
  #log bins for plotting
  bin_values=log(bin_values)
  p.plot(bin_values[:7], mean_values[:7], 'o', color='blue') # plot binned data
  (a_s,b_s,r,tt,stderr)=stats.linregress(bin_values[:7],mean_values[:7])
  p.plot(linspace(2.7,4,20),polyval([a_s,b_s],linspace(2.7,4,20)),'-',color='blue')
  
  p.plot(bin_values[7:], mean_values[7:], 'o', color='red') # plot binned data
  (a_s,b_s,r,tt,stderr)=stats.linregress(bin_values[7:],mean_values[7:])
  p.plot(linspace(3.5,4.9,20),polyval([a_s,b_s],linspace(3.5,4.9,20)),'-',color='red')    

  p.xlabel(r"ln(V$_{birth}$)")
  p.ylabel(ylab)
  #p.title('linear')
  f1.savefig(save_name)

################# plot metabolic rate vs biomass ##################

def plot_rate_vs_mass(array_vs,ks):
  #array_v=array_vs
  #k_growth = ks
  colors = ['#800000','#c87942']#,'#008080','#82bcd3']
  #col='#82bcd3'
  f1 = p.figure()
  for array_v, k_growth,col in zip(array_vs,ks,colors):
    zahl = max([len(i) for i in array_v['R'].flat if i]) # longest list of X values
    nr_cells=array_v.size
    tmp2=zeros((nr_cells,zahl),dtype=float)
    tmp3=zeros((nr_cells,zahl),dtype=float)

    for k1, vector in enumerate(array_v.flat):
      if vector['R']:
	  for k2, r, am, ad, v in zip(range(zahl-len(vector['R']),zahl),vector['R'],vector['B_Am'],vector['B_Ad'],vector['V']):
	    if vector['S_entry'] != 0:
	      tmp2[k1,k2] = log2(r + am + ad) # cell mass
	      tmp3[k1,k2] = log2(r * (am + ad) * k_growth / v) # metabolic rate
    
    tmp2 = array([i for i in tmp2 if i[-1]!=0])
    tmp3 = array([i for i in tmp3 if i[-1]!=0])
    p.plot(tmp2[:,-1],tmp3[:,-1],'o',color=col)
    
    (a_s,b_s,r,tt,stderr)=stats.linregress(tmp2[:,-1],tmp3[:,-1])
    p.text(min(tmp2[:,-1])+1,min(tmp3[:,-1]),'slope = %s'%(round(a_s,2)))
    p.plot(linspace(min(tmp2[:,-1]),max(tmp2[:,-1]),2),polyval([a_s,b_s],linspace(min(tmp2[:,-1]),max(tmp2[:,-1]),2)),'-',color='#25597c',lw=3)

  p.xlabel('Cell mass')
  p.ylabel('Metabolic rate')
  f1.savefig('rate_vs_mass_0.02_and_0.03_SG2_68_G2_cells.pdf')

################# plot and calculated mass doubling time ##################

def plot_calc_mdt(array_v,save_name):
  zahl = max([len(i) for i in array_v['B_R'].flat if i]) # longest list of X values
  nr_cells=array_v.size
  tmp2=zeros((nr_cells,zahl),dtype=float)

  for k1, vector in enumerate(array_v.flat):
    if vector['B_R']:
      for k2, v, am, ad in zip(range(zahl-len(vector['B_R']),zahl),vector['B_R'],vector['B_Am'],vector['B_Ad']):
        tmp2[k1,k2] = v+am+ad
  
  summed=sum(tmp2, axis=0)
  f1 = p.figure()
  x_ax = range(len(summed))
  
  p.plot(x_ax,log2(summed),'o',ms=10,mec='#82bcd3',color='#82bcd3')
  start=len(x_ax)/4
  (a_s,b_s,r,tt,stderr)=stats.linregress(x_ax[start:],log2(summed)[start:])
  p.plot(linspace(0,len(summed),100),polyval([a_s,b_s],linspace(0,len(summed),100)),'-',color='#25597c',lw=3)
  
  text_loc = max(p.ylim())
  p.text(start,text_loc-1,r"%s Minutes generation time"%(round(1/a_s,2)))
  p.text(start,text_loc-2,r"%s Hours"%(round(1/(a_s*60),2)))
  p.text(start,text_loc-3,r"%s Rate"%(round((a_s*60),2)))

  p.ylabel('log2(A+R)')
  p.xlabel('Time (min)')
  
  f1.savefig(save_name)
  f1.savefig(save_name.replace('pdf','png'))

  # and export data as txt file
  save_name=save_name.replace('pdf','txt')
  f=open(save_name,'w')
  for i,j in zip(x_ax,log2(summed)):
    f.write('%s,%s\n'%(i,j)) # csv file with time, mean, sd
  f.close()

################# plot lifecycle of a cell: [X] ##################

def plot_X_life(array_v, X, xlab, ylab, save_name, logit):
  f1 = p.figure()
  
  zahl = max([len(i) for i in array_v[X].flat if i]) # longest list of X values
  nr_cells=array_v.size
  tmp=zeros((nr_cells,zahl),dtype=[('value',float),('field',bool)])

  tmp_mn=[]
  tmp_sd=[]
  for k1, vector in enumerate(array_v.flat):
    if vector[X]:
      for k2, v in zip(range(zahl-len(vector[X]),zahl),vector[X]):
        tmp[k1,k2] = (v,True)
      if not logit: p.plot(range(zahl-len(vector[X]),zahl),vector[X], alpha=0.1)
      else: p.plot(range(zahl-len(vector[X]),zahl),log10(vector[X]), alpha=0.1) #log-scale
  for m in range(zahl):
    if not logit: tmp_list=[n for n,b in tmp[:,m] if b==True]
    else: tmp_list=[log10(n) for n,b in tmp[:,m] if b==True] #log-scale
    tmp_mn.append(mean(tmp_list))
    tmp_sd.append(std(tmp_list))
  tmp_mn=array(tmp_mn)
  tmp_sd=array(tmp_sd)

  p1,=p.plot(range(zahl-len(tmp_mn),zahl), tmp_mn, color='#25597c',lw=3)
  p.fill_between(range(zahl-len(tmp_mn),zahl), tmp_mn-tmp_sd, tmp_mn+tmp_sd, color='#82bcd3', alpha=1 )
  
  p.plot(range(zahl-len(tmp_mn),zahl), tmp_mn-tmp_sd, color='black',lw=0.3)  # plot black line along standart deviation lower end
  p.plot(range(zahl-len(tmp_mn),zahl), tmp_mn+tmp_sd, color='black',lw=0.3)  # plot black line along standart deviation upper end

  r = p.Rectangle((0, 0), 1, 1,facecolor='#82bcd3', alpha=1,edgecolor='black',lw=0.3) # creates rectangle patch for legend use.
  p.legend([p1,r],('Mean','Standard deviation'),loc='best',shadow=True)

  if not logit:
    pass
  else: p.yticks(p.yticks()[0], [round(10**q,2) for q in p.yticks()[0]])

  # p.xlim(850,1250) # to zoom in 

  p.xlabel(xlab)
  p.ylabel(ylab)
  f1.savefig(save_name)
  f1.savefig(save_name.replace('pdf','png'))

  # and put in txt file
  save_name=save_name.replace('pdf','txt')
  f=open(save_name,'w')
  for i,j,k in zip(range(zahl-len(tmp_mn),zahl),tmp_mn,tmp_sd):
    f.write('%s,%s,%s\n'%(i,j,k)) # csv file with time, mean, sd
  f.close()
    
################# plot [X] vs [Y] ##################

def plot_X_Y(tmp_array_v, X, Y, xlab, ylab, save_name, int_1, int_2):
  f1 = p.figure()
  ax = Axes3D(f1)
  #ax.view_init(16, -75)
  for array_v,z in zip(tmp_array_v,[30, 20, 10, 0]):
    i=1
    for vector in array_v.flat:
      if vector[X] and len(vector[X])>=int_1 and i <= int_2:
	p.plot(vector[X], vector[Y], z, 'o', alpha=0.1)
	i += 1
  ax.set_xlabel(xlab)
  ax.set_ylabel(ylab)
  #p.show()
  f1.savefig(save_name)


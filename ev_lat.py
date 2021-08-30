#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Jun 19 16:41:07 2021

@author: ayon
"""


import csv
import os
evla=[]
evlo=[]
stla=[]
stlo=[]
Q=[]
with open('Catalog.dat','r') as text:
    reader=csv.reader(text,skipinitialspace='True',delimiter=' ')
    for row in reader:
        evla.append(float(row[1]))
        evlo.append(float(row[2]))
        stla.append(float(row[3]))
        stlo.append(float(row[4]))
        Q.append(float(row[5]))
with open('f_lat_st.txt','w') as text:
     for i in range(len(evla)):
         text.write(str(stlo[i])+' '+str(stla[i])+'\n')
with open('f_lat_ev.txt','w') as text:
     for i in range(len(evla)):
         text.write(str(evlo[i])+' '+str(evla[i])+'\n')
         
with open('f_lat_ev_st_400.txt','w') as text1:
     for i in range(len(evla)):
     	  if Q[i]<360.258:
     	     text1.write(str(evlo[i])+' '+str(evla[i])+'\n')
     	     text1.write(str(stlo[i])+' '+str(stla[i])+'\n')   	     
with open('f_lat_ev_st_800.txt','w') as text3:
      for i in range(len(evla)):
     	  if Q[i]>=550.261:
	         text3.write(str(evlo[i])+' '+str(evla[i])+'\n')
	         text3.write(str(stlo[i])+' '+str(stla[i])+'\n')
with open('f_lat_ev_st_600.txt','w') as text2:
      for i in range(len(evla)):
     	  if Q[i]<550.261 and Q[i]>=360.258:
	         text2.write(str(evlo[i])+' '+str(evla[i])+'\n')
	         text2.write(str(stlo[i])+' '+str(stla[i])+'\n')

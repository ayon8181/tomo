#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun May 30 23:31:26 2021

@author: ayon
"""

import csv
import os
evla=[]
evlo=[]
stla=[]
stlo=[]
Q=[]
Qer=[]
dist=[]  
codal=[]
name=[]
eta=[]
etaer=[]
depth=[]
with open('final_cata_l1000_save.text', 'r') as text:
    reader=csv.reader(text,skipinitialspace='True',delimiter=' ')
    next(reader,None)
    for row in reader:
        name.append(row[0])
        evla.append(float(row[3]))
        evlo.append(float(row[4]))
        stla.append(float(row[5]))
        stlo.append(float(row[6]))
        depth.append(float(row[7]))
        Q.append(float(row[8]))
        Qer.append(float(row[9]))
        dist.append(float(row[1]))
        codal.append(float(row[13]))
        eta.append(float(row[10]))
        etaer.append(float(row[11]))
k=0        
with open('Catalog.dat','w') as text1:
     for i in range(len(Q)):
         
         	
         text1.write(name[i]+' '+str(evla[i])+' '+str(evlo[i])+' '+str(stla[i])+' '+str(stlo[i])+' '+str(Q[i])+' '+str(Qer[i])+' ' +str(eta[i])+' '+str(etaer[i])+' '+'\n')
            
            #os.system('mv '+str(name[i])+' ./good/')
            #if depth[i]<100:
               #k=k+1
        #else:
             #os.system('mv '+str(name[i])+' ./bad/')    
                
#

import numpy as np
import matplotlib.pyplot as plt
import os
import csv
import operator

dist=[]
Q=[]
eta=[]
Qer=[]
etaer=[]
Qlist=[]
etalist=[]
rms=[]
depth=[]
no=0
with open('final_cata.text','r') as textfile:
     text=csv.reader(textfile,delimiter=" ")
     for row in text:
         dist.append(float(row[1]))
         Q.append(float(row[8]))
         Qer.append(float(row[9]))
         eta.append(float(row[10]))
         etaer.append(float(row[11]))
         depth.append(float(row[7]))
         
         if np.abs(float(row[14]))>=0.0 :#and float(row[7])<50.0:
            no=no+1
            rms.append(float(row[14]))
            Qlist.append([float(row[7]),float(row[8]),float(row[9])])
            etalist.append([float(row[7]),float(row[10]),float(row[11])])
             
sorted(Qlist,key=operator.itemgetter(0)) 
sorted(etalist,key=operator.itemgetter(0)) 
print(no)
pQ=[]
pdist=[]
pdist2=[]
pQer=[]
peta=[]
petaer=[]
for i in range(len(Qlist)):
    pQ.append(Qlist[i][1])
    pdist.append(Qlist[i][0])
    pQer.append(Qlist[i][2])
for i in range(len(etalist)):
    peta.append(etalist[i][1])
    pdist2.append(etalist[i][0])
    petaer.append(etalist[i][2])

font = {'family': 'serif',
        'color':  'darkred',
        'weight': 'normal',
        'size': 18,
        }
plt.figure(1,figsize=(15,10))
#plt.scatter(pdist,pQ)
#plt.xlim(0,1500)
plt.ylim(0,1500)
plt.errorbar(pdist,pQ,yerr=pQer,color='red',fmt='h',capsize=2, ecolor='black')
plt.xlabel('Depth(km)',fontdict=font)
plt.ylabel('Qo',fontdict=font)
plt.grid()
plt.show()
plt.figure(2,figsize=(15,10))
#plt.scatter(pdist,pQ)
#plt.xlim(0,1500)
plt.ylim(0,1.5)
plt.errorbar(pdist2,peta,yerr=petaer,color='red',fmt='h',capsize=2, ecolor='black')
plt.xlabel('Depth(km)',fontdict=font)
plt.ylabel('eta',fontdict=font)
plt.grid()
plt.show()
plt.figure(3,figsize=(15,10))
bins=[200,250,300,350,400,450,500,550,600,800,1005]
width=100
plt.grid()
plt.hist(pQ,bins=bins)
plt.xlabel('Qo values',fontdict=font)
plt.ylabel('frequency',fontdict=font)
plt.show()
plt.figure(4,figsize=(15,10))
bins=[0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0]
width=0.1
plt.grid()
plt.hist(peta,bins=bins)
plt.xlabel('eta values',fontdict=font)
plt.ylabel('frequency',fontdict=font)
plt.show()
    

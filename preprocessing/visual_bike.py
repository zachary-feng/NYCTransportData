# -*- coding: utf-8 -*-
"""
Created on Sat Nov 18 15:48:12 2017

@author: Zachary Feng
"""

import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
import datetime

tbl = pd.read_csv('201410-citibike-tripdata.csv', usecols = ['start station longitude', 'start station latitude', 'end station longitude', 'end station latitude', 'tripduration', 'starttime'])

cols = tbl.columns.tolist()
cols = [cols[3],cols[2],cols[5],cols[4],cols[0],cols[1]]
tbl = tbl[cols]

dt = pd.to_datetime(tbl['starttime'], format = '%m/%d/%Y %H:%M:%S')
dt0 = pd.to_datetime("10/01/2014 00:00:00", format = '%m/%d/%Y %H:%M:%S')

tblarr = np.array(tbl)
tblarr[:,[0,2]] += 100
      
a = []
for i in range(828711):
    a.append((dt[i] - dt0).total_seconds())
    
tblarr[:,5] = a
      
#plt.scatter(tblarr[:,0], tblarr[:,1])
#plt.show()

np.savetxt("tbldraw.csv", tblarr, fmt = '%.5lf', delimiter = ',')
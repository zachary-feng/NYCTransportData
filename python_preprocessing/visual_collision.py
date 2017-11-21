# -*- coding: utf-8 -*-
"""
Created on Sat Nov 18 12:34:46 2017

@author: Zachary Feng
"""

import pandas as pd
import matplotlib.pyplot as plt

var = []
for i in range(5):
    var.append('VEHICLE ' + str(i + 1) + ' TYPE')
    

tbl = pd.read_csv("NYC-vehicle-collisions.csv", usecols = ['LONGITUDE', 'LATITUDE', var[0], var[1], var[2], var[3], var[4]])
tbl = tbl.dropna()

cat = set()
for i in range(5):
    cat.update(set(tbl[var[i]]))
    
watch = 'BICYCLE'
tblHot = tbl.ix[(tbl[var[0]] == watch) |
                (tbl[var[1]] == watch) |
                (tbl[var[2]] == watch) |
                (tbl[var[3]] == watch) |
                (tbl[var[4]] == watch) ]

fig = plt.figure()
ax = fig.add_subplot(111)

ax.scatter(tblHot['LONGITUDE'], tblHot['LATITUDE'])
plt.show()
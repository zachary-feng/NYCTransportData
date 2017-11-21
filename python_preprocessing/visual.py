# -*- coding: utf-8 -*-
"""
Created on Fri Nov 17 21:03:00 2017

@author: Zachary Feng
"""

import pandas as pd
import matplotlib.pyplot as plt

tbl = pd.read_csv("NYC-vehicle-collisions.csv", usecols = ['LATITUDE', 'LONGITUDE', 'VEHICLE 1 FACTOR', 'ON STREET NAME', 'CROSS STREET NAME'])
factor = 'VEHICLE 1 FACTOR'

cat = set(tbl[factor]) # categorical array

'''
for i in cat:
    temp = str(i)
    temp = temp.replace("/", "-")
    cat.discard(i)
    cat.add(temp)
'''

# variables
choice = 'DRIVERLESS/RUNAWAY VEHICLE'
backcolor = 'darkgrey'
forecolor = 'gold'
backsize = 0.1
foresize = 2

# color dictionary
color_dict = {}
for i in cat:
    color_dict[i] = backcolor
color_dict[choice] = forecolor # view specific element

# size dictionary
size_dict = {}
for i in color_dict:
    if color_dict[i] == backcolor:
        size_dict[i] = backsize
    else:
        size_dict[i] = foresize
                 
# table containing only specified element
tblHot = tbl[tbl[factor] == choice]
tblHot = tblHot.dropna()
print([tblHot['LATITUDE'], tblHot['LONGITUDE']])


'''
fig = plt.figure()
ax = fig.add_subplot(111)
ax.set_xlim(40.493020, 40.889224)
ax.set_ylim(-74.271512, -73.686490)
ax.set_title(choice)
ax.set_facecolor('black')

ax.scatter(tbl['LATITUDE'], tbl['LONGITUDE'],
           s = [ size_dict[i] for i in tbl[factor] ],
           color = [ color_dict[i] for i in tbl[factor] ])
ax.scatter(tblHot['LATITUDE'], tblHot['LONGITUDE'], s = foresize, color = forecolor)
plt.show() '''

# repeat
'''
for j in cat:
    # variables
    choice = str(j)
    backcolor = 'darkgrey'
    forecolor = 'gold'
    backsize = 0.1
    foresize = 5
    
    # color dictionary
    color_dict = {}
    for i in cat:
        color_dict[i] = backcolor
    color_dict[choice] = forecolor # view specific element
    
    # size dictionary
    size_dict = {}
    for i in color_dict:
        if color_dict[i] == backcolor:
            size_dict[i] = backsize
        else:
            size_dict[i] = foresize
                     
    # table containing only specified element
    tblHot = tbl[tbl[factor] == choice]
    
    fig = plt.figure()
    ax = fig.add_subplot(111)
    ax.set_xlim(40.493020, 40.889224)
    ax.set_ylim(-74.271512, -73.686490)
    ax.set_facecolor('black')
    
    ax.scatter(tbl['LATITUDE'], tbl['LONGITUDE'],
               s = [ size_dict[i] for i in tbl[factor] ],
               color = [ color_dict[i] for i in tbl[factor] ])
    ax.scatter(tblHot['LATITUDE'], tblHot['LONGITUDE'], s = foresize, color = forecolor)
    plt.show()
    
    temp = str(j)
    temp = temp.replace("/", "-")
    plt.savefig(temp + '.png')
'''
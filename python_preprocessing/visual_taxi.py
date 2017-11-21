# -*- coding: utf-8 -*-
"""
Created on Sat Nov 18 14:20:41 2017

@author: Zachary Feng
"""

import pandas as pd
import matplotlib.pyplot as plt

tbl = pd.read_csv('nyc-subway-turnstile-and-weather.csv', usecols = ['Date/Time', 'Lat', 'Lon'])


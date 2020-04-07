# -*- coding: utf-8 -*-
"""
Created on Tue Mar 31 20:16:34 2020

@author: danie
"""

# import packages
import ephem as e # this package is useful in astronomical calculations
import matplotlib.pyplot as mp
import numpy as np

# create an object for each planet
me = e.Mercury();
v = e.Venus();
ma = e.Mars();
j = e.Jupiter();
s = e.Saturn();
u = e.Uranus();
n = e.Neptune();
p = e.Pluto();

# write a function that takes inputs of planet and date (as a string of 
# format yyyy/mm/dd) and returns a graph of the planet's position relative to
# the Earth, which is located at the origin
def position(pl,date):
    # position is returned in terms of right ascension (hours of arc around
    # celestial equator) and declination (degrees north of celestial equator)
    pl.compute(date);
    
    # on a cartesian plane, take right ascension to be analogous to x and 
    # declination to be analogous to y
    x = pl.ra;
    y = pl.dec;
    
    # convert cartesian coordinates to polar coordinates
    r = np.sqrt(x**2+y**2);
    theta = np.arctan2(y,x);
    
    # graph result
    graph = mp.polar(theta,r);
    return graph

### only an empty plot is being returned - can't figure out how to get it to 
### plot the point
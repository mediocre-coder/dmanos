# -*- coding: utf-8 -*-
"""
Created on Tue Mar 31 20:16:34 2020

@author: danie
"""

# import pyephem
import ephem as e

# create an object for each planet
me = e.Mercury()
v = e.Venus()
e = e.Earth()
ma = e.Mars()
j = e.Jupiter()
s = e.Saturn()
u = e.Uranus()
n = e.Neptune()
p = e.Pluto()

# write a function that takes inputs of planet, year, month, and day and 
# returns a graph of the planet's position relative to the Earth
def position(y,m,d):
    
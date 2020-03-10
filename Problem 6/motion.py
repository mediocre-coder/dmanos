# -*- coding: utf-8 -*-
"""
Starting point for Problem 6a
"""

# import libraries
import numpy as np
import math as ma
import matplotlib.pyplot as mp

# set default values
v = 10; 
ang = 45;
h = 0;
g = 9.81;

# write functions
def projectile(v,ang,h,g):
    # takes inputs in m, s, deg
    # convert deg to rad
    convertangle(ang,"deg");
    # find components of velocity
    vix = v*(ma.cos(n2));
    viy = v*(ma.sin(n2));
    # calculate max height of flight
    hmax = (2*((viy)**2)/g) + h;
    # calculate time of flight
    tf = (ma.sqrt(2*hmax/g)) + ma.sqrt(2*h/g);
    # calculate range of flight
    r = vix*tf;
    # write function to graph trajectory
    def trajectory(r,hmax):
       # define range of vales
       t = np.linspace(0,tf);
 # can't figure out what the python versions of array operations (ex .*) are     
       h = (viy*t)-(1/2)*g*(t**2)+h;
       ra = vix*t;
       mp(ra,h)
       mp.title("Trajectory of a Projectile")
       mp.xlabel("Range (m)")
       mp.ylabel("Height (m)")
       return()
    return r,tf,hmax    

def freefall(h,v,g):
    # takes inputs in m, s
    # calculate final velocity
    vf = ma.sqrt(v**2+2*g*h);
    # calculate time of flight
    tf = (vf-v)/g;
    return vf,tf
    
# write functions to convert units
def convertheight(n1,u1):
    # takes inputs in m or ft
    # set conversion for m to ft
    if u1 == "m":
        n2 = n1*3.281;
        u2 = "ft";
    # set conversion for ft to m
    elif u1 == "ft":
        n2 = n1/3.281;
        u2 = "m";
    return n2,u2

def convertvelocity(n1,u1,u2):
    # takes inputs in m/s, mph, or ft/s
    # set conversion for m/s to mph or ft/s
    if u1 == "m/s" and u2 == "mph":
        n2 = n1*2.237;
    elif u1 == "m/s" and u2 == "ft/s":
        n2 = 3.281;
    # set conversion for mph to m/s or ft/s
    if u1 == "mph" and u2 == "m/s":
        n2 = n1/2.237;
    elif u1 == "mph" and u2 == "ft/s":
        n2 = n1*1.467;
    # set conversion for ft/s to m/s or mph
    if u1 == "ft/s" and u2 == "m/s":
        n2 = n1/3.281;
    elif u1 == "ft/s" and u2 == "mph":
        n2 = n1/1.467;
    return n2,u2
        
def convertangle(n1,u1):
    # takes inputs in deg or rad
    # set conversion for deg to rad
    if u1 == "deg":
        n2 = n1*(ma.pi)/180;
        u2 = "rad";
    # set conversion for rad to deg
    elif u1 == "rad":
        n2 = n1*180/(ma.pi);
        u2 = "deg";
    return n2,u2
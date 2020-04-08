# -*- coding: utf-8 -*-
"""
Created on Sun Apr  5 23:30:25 2020

@author: danie
"""

# air resistance? in physics? unheard of!

# import packages
from scipy.integrate import odeint as ode
import numpy as np
import math as ma
import matplotlib.pyplot as pp

# define constants
g = 9.81;
rho = 1.225; # air density from Google
C = .1; # drag coeffecient of a sphere from Google
A = 5; # randomly decided number
m = 5; # randomly decided number

# calculate drag force coeffecient for use in motion equations
fdrag = (C*rho*A)/(2*m);

# write function
def projprojectile(hi=10,vi=60,angi=45):
    # accepts inputs of initial height in m, initial velocity in m/s, and
    # initial angle in deg and returns max height, range, time of flight, and
    # a graph of trajectory
    # error messages for inavalid inputs
    if hi < 0:
        print('height must be 0 or greater')
    if vi <= 0:
        print('velocity must be greater than 0')
    if angi <=0 or angi >= 90:
        print('angle must be between 0 and 90 degrees')
    # convert deg to rad
    angrad = np.radians(angi);
    # calculate components of initial velocity
    vix = vi*(ma.cos(angrad));
    viy = vi*(ma.sin(angrad));
    # create arrays
    x = 0;
    y = hi;
    xarray = np.array([x, vix]);
    yarray = np.array([y, viy]);
    # calculate time and timespan
    t = (np.sqrt(viy**2+2*g*hi)+viy)/g;
    timespan = np.linspace(0,t);
    # make functions that return arrays
    # thanks to Ian's code for help with this
    def odex(x,t):
        vx = x[1];
        return np.array([vx,-fdrag*vx**2]);
    def odey(y,t):
        vy = y[1];
        return np.array([vy,-g-fdrag*vy**2]);
    # solve odes
    xsol = ode(odex,xarray,timespan);
    ysol = ode(odey,yarray,timespan);
    # calculate positions
    xpos = xsol[:,0];
    ypos = ysol[:,0];
    # calculate output values
    hmax = np.amax(ypos);
    range = xpos[len(ypos)-1];
    time = timespan[len(ypos)-1];
    # graph
    traj = pp.plot(x[:,0],y[:,0]);
    pp.xlabel('range (m)');
    pp.ylabel('height (m)');
    pp.title('trajectory of a projectile with drag');
    pp.xlim(0,range+1);
    pp.ylim(0,hmax+1);
    return hmax,range,time,traj
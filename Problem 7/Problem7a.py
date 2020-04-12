# -*- coding: utf-8 -*-
"""
Created on Sat Mar 28 20:41:23 2020

@author: danie
"""

# import pandas
import pandas as p

# import data and add extract needed columns
clim = p.read_csv('climate.txt', sep='  ', header=None)
clim.columns = ['year','fossilfuel','landuse','cumsum','avgtemp','lower','upper'];
gtbm = p.read_csv('GlobalTempbyMonth.txt', sep='  ', header=None, usecols=[0,1], names=['month', 'avgtemp'], engine='python');

# append column to climate that contain the amount of carbon added yearly
clim['carbonaddedyearly'] = clim.fossilfuel + clim.landuse;

# determine the hottest 10 years
def hottestyears(table=clim,column=clim.avgtemp,years=clim.year,amt=10):
    list1 = table.sort_values(by=[column],ascending=False);
    sortlist1 = list1(p.sort[years][0:amt]);
    return sortlist1

# determine the 10 years with the most carbon emitted
def mostcarbon(table=clim,column=clim.carbonaddedyearly,years=clim.year,amt=10):
    list2 = table.sort_values(by=[column],ascending=False);
    sortlist2 = list2(p.sort[years][0:amt]);
    return sortlist2

# determine the relationship between the 2 sets of years
def relationship(data1=sortlist1,data2=sortlist2):
    sameyears1 = list(set(data1).intersection(set(data2)));
    return sameyears1

# list the top 20 hottest months
def hottestmonths(table=gtbm,column=gtbm.avgtemp,months=gtbm.month,amt=20):
    list3 = table.sort_values(by=[column],ascending=False);
    sortlist3 = list3(p.sort[months][0:amt]);
    return sortlist3

# determine if there is overlap with the 10 hottest years
def overlap(data1=sortlist1,data2=sortlist3):
    sameyears2 = list(set(data1).intersection(set(data2)));
    return sameyears2

# create a list of years sorted by global avg temp
def yearlist(table=clim,column=clim.avgtemp,years=clim.year):
    sorttemps = table.sort_values(column, ascending=False);
    sortyear = sorttemps.years;
    records = p.DataFrame(sortyear);
    return records

# write the data to an excel file with 3 separate sheets
def writetofile(sheet1=clim,sheet1name='climate',sheet2=gtbm,sheet2name='monthly temps',sheet3=records,sheet3name='records',filename='climate.xlsx'):
    writer = p.ExcelWriter('filename', engine='xlswriter');
    sheet1.to_excel(writer, sheet_name=sheet1name);
    sheet2.to_excel(writer, sheet_name=sheet2name);
    sheet3.to_excel(writer, sheet_name=sheet3name);
    file = writer.save()
    return file
    
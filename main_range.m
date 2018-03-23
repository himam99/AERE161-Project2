%Hammad Imam // himam@iastate.edu
%AERE 161 Project 2
%Script 
%Initializes parameters and calls flightpath.m and plot_range.m

clear, clc;

%constant values used throughout
v0 = 600;
theta = 60;
k = (0:0.001:0.08);

%call flightpath.m, use value to plot range.
fs = flightpath(v0,theta,k);
plot_range(fs);
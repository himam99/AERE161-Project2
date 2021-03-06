%Hammad Imam // himam@iastate.edu
%AERE 161 Project 2
%Script
%Initializes parameters and calls flightpath.m and plot_flightpaths.m

clear, clc;

%Initializing parameters
v0 = 600;
theta = 60;
k = [0 0.005 0.01 0.02 0.04 0.08];

%call flightpath.m, feed data to plot_flightpaths.m
fs = flightpath(v0,theta,k);
plot_flightpaths(fs);
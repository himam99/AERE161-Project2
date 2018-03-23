%Hammad Imam // himam@iastate.edu
%AERE 161 Project 2
%A script which initializes parameters and calls flightpath.m and
%plot_flightpaths.m

clear, clc;

v0 = 600;
theta = 60;
k = [0 0.005 0.01 0.02 0.04 0.08];

fs = flightpath(v0,theta,k);
fs(1)
fs(2)

plot_flightpaths(fs);
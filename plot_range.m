%Hammad Imam // himam@iastate.edu
%AERE 161 Project 2
%Function
%Plots several range plots

function plot_range(fs)

k = [];
x = [];
t = [];

%gather k, tmax, and xmax into vectors
for i = 1:size(fs,2)
    k(i) = fs(i).k
    x(i) = fs(i).x(end)
    t(i) = fs(i).t(end)
end

%Range x, Resistance k
figure
plot(k, x);
xlabel('Coefficient of Resistance, k, [1/s]');
ylabel('Range, x_max, [m]');

%Total Time t, Resistance k
figure
plot(k, t);
xlabel('Coefficient of Resistance, k, [1/s]');
ylabel('Total Time, t_max, [t]');
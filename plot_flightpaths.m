%Hammad Imam // himam@iastate.edu
%AERE 161 Project 2
%Function
%Plots y(x), y(t), u(t), and v(t)

function plot_flightpaths(fs)
%create empty strings that will be filled with code to be run
p = ''; 
l = '';

%Altitude, y / Distance, x
figure
for i = 1:size(fs,2) %for every part of the struct
    p = strcat(p,sprintf('fs(%d).x, fs(%d).y,',i,i)); 
    %extract the x and y vectors and append them to p
    l = strcat(l, sprintf('num2str(fs(%d).k),',i));
    %extract the k value to fill in the legend
end
pl = strcat('plot(',p(1:end-1),');'); 
%use p to generate the items in the plot, strcat to pl to make it run
leg = strcat('lgd = legend(',l(1:end-1),');'); 
%use l to generate a legend
eval(pl); %generate the plot with all the different x/y pairs
xlabel('Distance, x, [m]');  %label the x
ylabel('Altitude, y, [m] '); %label the y
title('Altitude vs Distance'); %give it a title
eval(leg); %generate the legend
title(lgd, 'k, [1/s]'); %title the legend

%everything after this is similar to the first example

%Altitude, y / Time, t
figure
p = '';
for i = 1:size(fs,2)
    p = strcat(p,sprintf('fs(%d).t, fs(%d).y,',i,i));
end
pl = strcat('plot(',p(1:end-1),');');
eval(pl);
xlabel('Time, t, [s]');
ylabel('Altitude, y, [m] ');
title('Altitude vs Time');
eval(leg);
title(lgd, 'k, [1/s]');

%Horizontal Velocity, v_x / Time, t
figure
p = '';
for i = 1:size(fs,2)
    p = strcat(p,sprintf('fs(%d).t, fs(%d).u,',i,i));
end
pl = strcat('plot(',p(1:end-1),');');
eval(pl);
xlabel('Time, t, [s]');
ylabel('Horizontal Velocity, v_x, [m/s] ');
title('Horizontal Velocity vs Time');
eval(leg);
title(lgd, 'k, [1/s]');

%Vertical Velocity, u / Time, t
figure
p = '';
for i = 1:size(fs,2)
    p = strcat(p,sprintf('fs(%d).t, fs(%d).v,',i,i));
end
pl = strcat('plot(',p(1:end-1),');');
eval(pl);
xlabel('Time, t, [s]');
ylabel('Vertical Velocity, v_y, [m/s] ');
title('Vertical Velocity vs Time');
eval(leg);
title(lgd, 'k, [1/s]');
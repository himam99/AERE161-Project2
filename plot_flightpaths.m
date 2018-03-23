%Hammad Imam // himam@iastate.edu
%AERE 161 Project 2
%Function
%Plots several flightpaths

function plot_flightpaths(fs)

p = '';
l = '';

%Altitude, y / Distance, x
figure
for i = 1:size(fs,2)
    p = strcat(p,sprintf('fs(%d).x, fs(%d).y,',i,i));
    l = strcat(l, sprintf('num2str(fs(%d).k),',i));
end
pl = strcat('plot(',p(1:end-1),');');
leg = strcat('lgd = legend(',l(1:end-1),');');
eval(pl);
xlabel('Distance, x, [m]');
ylabel('Altitude, y, [m] ');
title('Altitide vs Distance');
eval(leg);
title(lgd, 'k, [1/s]');

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
title('Altitide vs Time');
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
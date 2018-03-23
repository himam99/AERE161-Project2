%Hammad Imam // himam@iastate.edu
%AERE 161 Project 2
%Function
%Plots several flightpaths

function plot_flightpaths(fs)

pstring = ''
figure
for i = 1:size(fs,2);
    pstring = strcat(pstring,sprintf('fs(%d).x, fs(%d).y,',i,i));
end
runthis = strcat('plot(',pstring(1:end-1),');')
eval(runthis);
xlabel('x');
ylabel('y');
legend('k1', 'k2');

figure
plot(fs.t, fs.y);
xlabel('t');
ylabel('y');
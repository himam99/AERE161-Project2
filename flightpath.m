%Hammad Imam // himam@iastate.edu
%AERE 161 Project 2
%Function 
%Calculates the characteristics of the projectile flightpath.
%Input: v0, theta, k
%Output: Range, flight time, speed/position as a function of time
%(vectors: t, u, v, x, y)

function fs = flightpath(v0, theta, k)
    g = 9.81;
    res = 10;        
    v_x = v0*cosd(theta);
    v_y = v0*sind(theta);
        
    for i = 1:size(k,2)
        fs(i).k = k(i);

        if k(i) == 0
            tmax = (2*v0*sind(theta))/g;
            for j = 1:res
                t = j*tmax/res;
                fs(i).t(j) = t;
                
                fs(i).u(j) = v_x;
                fs(i).v(j) = v_y - g*t;
                
                fs(i).x(j) = v_x * t;
                fs(i).y(j) = v_y*t - .5*g*(t^2);
            end
        else
            j = 1;
            tmax = (2*v0*sind(theta))/g;
            for j = 1:res
                t = j*tmax/res;
                fs(i).t(j) = t;
                fs(i).u(j) = v_x * exp(-k(i)*t);
                fs(i).v(j) = v_y * exp(-k(i)*t) + (g/k(i))*(exp(-k(i)*t) -1);
                
                fs(i).x(j) = (v_x / k(i))*(1 - exp(-k(i)*t));
                fs(i).y(j) = v0 * sind(theta)*t - .5*g*(t^2);
                j = j+1;
                t = t + j/res
            end
        end
    end
end
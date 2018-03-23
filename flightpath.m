%Hammad Imam // himam@iastate.edu
%AERE 161 Project 2
%Function 
%Calculates the characteristics of the projectile flightpath.
%Input: v0, theta, k
%Output: struct containing t, x, y, u, v vectors for each k

function fs = flightpath(v0, theta, k)
    
    %assign constants to be used
    g = 9.81; %gravitational constant
    res = 1000; %resolution of data
    %split v into x and y components
    v_x = v0*cosd(theta);
    v_y = v0*sind(theta);
    tmax = (2*v0*sind(theta))/g; %find the max time
        
    for i = 1:size(k,2) %for every item in k, create a new struct element
        fs(i).k = k(i); %assign the struct element the value of k

        if k(i) == 0    %for the case with no air resistance
            for j = 1:res 
                %step the calculation to create res number of data pts
                t = (j/res)*tmax; 
                %increment time in small steps proportional to max time 
                fs(i).t(j) = t; 
                %set each element of the time vector to stepped time
                
                %velocity formulas
                fs(i).u(j) = v_x;
                fs(i).v(j) = v_y - g*t;
                
                %position formulas
                fs(i).x(j) = v_x * t;
                fs(i).y(j) = v_y*t - .5*g*(t^2);
            end
        else %if there is some air resistance
            for j = 1:res
                t = j*tmax/res;
                fs(i).t(j) = t;
                %similar setup to the ones above
                
                y = -g*t/k(i) + (k(i)*v_y + g)/( (k(i))^2 ) * (1 - exp(-k(i)*t));
                %find the altitude given time
                
                if y < 0    %in the case that the object lands on the ground
                    fs(i).t= fs(i).t(1:end-1); %remove the last data pt for time
                    break %end the for loop
                end
                
                %velocity formulas
                fs(i).u(j) = v_x * exp(-k(i)*t);
                fs(i).v(j) = v_y * exp(-k(i)*t) + (g/k(i))*(exp(-k(i)*t) -1);
                
                %position formulas (y was solved for earlier)
                fs(i).y(j) = y;
                fs(i).x(j) = (v_x / k(i))*(1 - exp(-k(i)*t));
            end
        end
    end
end
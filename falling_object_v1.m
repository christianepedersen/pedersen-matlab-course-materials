% 4/6/2020 example of object falling due to gravity
% Code by Christian Pedersen

clear all
close all
clc

%%

% Gravity accelerates objects downward at 9.81 m/s^2
% a = 9.81

% Equation for displacement over time
% x = x0 + v0*t
% x = x0 + v0*t + 0.5*a*t^2

% Equation for velocity over time
% v = v0 + a*t

% INSTRUCTIONS:
% Use the above equations within a loop to model the free fall of an 
% object due to gravity. Let's say the object starts at a height of 10000
% meters.
%
% 1) Plot the velocity and displacement of the object over time
%
% 2) Use matlab to find how long it takes for the object to hit the ground
%

%% Skeleton code:

a = 9.81; % m/s^2
v(1) = 0; % m/s
x(1) = 0; % m


% This is called a for loop, it repeats the contained lines of code for
% each value of t.
for t = 1:60 % calculating displacement and velocity for each second
    
    
    % Hint: calculate velocity for the next timepoint t
    v(t+1) = v(t) + a*1;
    
    % Hint: calculate displacement for the next timepoint t

    
end

% plot velocity over time
figure(1)
plot(1:61,v)
xlabel('Time (s)')
ylabel('Velocity (m/s)')

% plot displacement over time






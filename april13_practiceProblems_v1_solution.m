% MatLab Problem Set = Due Monday April 13 2020
% By Christian Pedersen

clear all
close all
clc

%% TOPICS

% 1) MatLab as a calculator  (matrix math versus element by element)

% 2) Using the help command

% 3) Using the plot command


%% Here i generate fake photometry data for us to practice with

% loading in example data
temp1 = load('stockreturns.mat').stocks';
channel470 = temp1(2,:)+150;
channel405 = temp1(1,:)+150;

% Instructions: A time series is a 1 dimensional matrix that has a single
% value (element) for each time step. For the sake of these exercises, we
% will use the time series generated above, channel470 and channel405. We
% will pretend that the each element of channel470 and channel 405 
% corresponds to 1 fluorescence sample per second. Use these variables
% to answer the below questions to the best of your abilities. Also, feel 
% free to google stuff like "matlab how to find length of a variable" if 
% you get stuck. 

%%
% 1) Using the length('variable') command, what is the length of the 470
% channel and the 405 channel variables.

length(channel470)

length(channel405)

size(channel470)

size(channel470,2)


% 2) Create a new variable 'subtracted' that has the 405 channel subtracted
% from the 470 channel

subtracted = channel470-channel405;


%%
% 3) Plot the 470 channel over time, plot the 405 channel over time, plot
% the subtracted time series over time.

plot(1:length(subtracted),subtracted)
xlabel('Time (s)')
ylabel('Fluorescence')


%%
% 4) Using code, print the tenth element of the variable channel470

channel470(10)

% 5) Using code, subtract the 55th element from the 40th element of channel405

channel470(40)-channel470(55)


%%
% 6) Using the 'help' command, read more details about the 'plot' command and
% the 'plotyy' command. What is the difference between these two types of
% graphs?

help plotyy

% The main difference is that plot yy has two separate y axises on either
% side of the plot


%%
% 7) Plot the 470 channel, 405 channel and subtracted variable in the same
% plot

plot(1:100,channel470,'',1:100,channel405,'r',1:100,subtracted,':')
xlabel('Time (s)')
ylabel('Fluorescence')
legend('470','405','Subtr')

% 8) Label the axises on the above plot and add a legend for the 3 lines


%% 
% 9) How many different ways can you use matlab (different lines of code)
% to find the square root of 1000?

sqrt(1000)

1000^0.5


%% Challenge (getting ahead of Coursera)
% 10) Use a single for loop and a single if, then statement within the for
% loop to add 5 to the 10th, 20th, 30th, 40th ... element of the variable
% channel470

% hint: Use the 'rem' command


for p = 1:length(channel470)

    if rem(p,10) == 0

        channel470(p) = channel470(p) + 5;

    end
    
end



%% extra for loop and if statement example

var = 10; % first element of var matrix

% loops through 9 times, k = 2.. k = 3.. k = 4.. etc
for k = 2:10
   
    k
    
    
    var(k) = var(k-1) + 10
    
    if k == 4  % the contained lines only run when k is equal to 4
        
        vari = var(k)
        
    end    
    
end


































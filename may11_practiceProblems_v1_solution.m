% MatLab Problem Set = Due Monday May 11 2020
% Corresponds to week 6 of Coursera Vanderbilt MatLab Course
% By Christian Pedersen

clear all  % clears all variables
close all  % closes all figures
clc    % clears command window


%% Here I load in example photometry data to practice with

% loading in example data
load('example_photom_drift_1Hz.mat')

% Instructions: A time series is a 1 dimensional matrix that has a single
% value (element) for each time step. For the sake of these exercises, we
% will use the time series generated above, raw470 and raw405. Each element
% corresponds to 1 fluorescence sample per second. Use these variables
% to answer the below questions to the best of your abilities. Also, feel 
% free to google stuff like "matlab how to find length of a variable" if 
% you get stuck. 



%% Question 1: If statements

% number = input('Enter a positive integer: ')
% The above 'input()' command will ask the user to enter a number and will
% save that value as the variable 'number'.

% A) Use the input() command to prompt yourself for a positive integer and
% save the integer as a variable called 'x1'. Use an if statement to return
% the text "This integer is odd" if it is odd, or "this integer
% is even" if it is even. (Hint: use the rem command

x1 = input('Enter a positive integer: ');

if rem(x1,2) == 1
    
    "This integer is odd"
    
elseif rem(x1,2) == 0
    
    "This integer is even"
    
else
   
    "This number is not an integer"
    
end


%% Question 2: Logical indexing


% A boolean matrix is a matrix that contains only 1's and 0's. The contents
% of the elements are binary, and we think about each element as being True
% or False. Binary matrices are also often called truth tables or logical arrays.


% Example: say we have a matrix a = [1 4 6 2 7]. If we ask matlab to find
% which elements of a are greater than 3, the output is a binary matrix.
% a>3 = [0 1 1 0 1]
% a==4 = [0 1 0 0 0]
% We can also use these logical arrays to specify indices of a matrix.
% a(a>3) = [4 6 7]
% a(a=4)


% A) Find the mean of the given variable 'raw470' and save it as a variable
% called 'avg470'.

avg470 = mean(raw470)

% B) Create a logical array that's elements are True when raw470 > avg470

logarray1 = raw470 > avg470

% C) Find the mean of the elements of raw470 that are greater than avg470

highset470 = raw470(logarray1==1);

mean(highset470)

% D) Find the mean of the elements of raw470 that are less than avg470.

lowset470 = raw470(logarray1==0);

mean(lowset470)

% E) Compare the two means from part C and part D. What does this imply about
% the distribution of values in raw 470? Is it symmetrical?


%% Question 3: Visualizing and quantifying dopamine neuron activity during 
% sucrose pellet consumption.

load('periChocoMat2.mat')

% The above code loads a 2 dimensional matrix variable 'periAllEvents2'.
% The rows of this matrix correspond to the photometry signal of dopamine
% neurons while an animal consumes a pellet. The 10 rows correspond
% to the 10 pellet eating bouts in a 30 minute session. Rows 3,4,7 and 9
% correspond to trials in which the mouse got a more appetitive chocolate
% pellet, while the others trials correspond to the eating of a normal
% sucrose pellet. The 40 columns correspond to fluorescence 
% measurements each second from 20 seconds before the onset of eating to 
% 20 seconds after.


% A) Use the imagesc() command to plot a heatmap of every pellet eating
% bout from -20 seconds to + 20 seconds.

figure()
imagesc(linspace(-20,20,40),1:10,periAllEvents2)

% B) Manually create a 10 element logical array that flags the trials in
% which the mouse gets the chocolate pellets. Call the variable 'chocoFlag'

chocoFlag = [0 0 1 1 0 0 1 0 1 0];

% C) Manually create a 10 element logical array that flags the trials in
% which the mouse gets the sucrose pellets. Call the variable 'sucroFlag'

sucroFlag = [1 1 0 0 1 1 0 1 0 1];

% D) Use imagesc() to create separate heatmaps for these two types of
% pellet trials. (one should be 4x40 in size, the other should be 6x40)
% (Hint: chocoMat = periAllEvents2(chocoFlag==1,:);

chocoMat = periAllEvents2(chocoFlag==1,:);

sucroMat = periAllEvents2(sucroFlag==1,:);

% E) Plot the mean peri-event fluorescence trace for each trial type. This
% allows us to see the average activity during the consumption of a
% chocolate pellet and a sucrose pellet. Try putting these on the same plot
% for close comparison.

choc = mean(chocoMat);

sucr = mean(periAllEvents2([1 2 5 6 8 10],:));

figure()
plot(linspace(-20,20,40),sucr,'',linspace(-20,20,40),choc,'')
legend('sucrose','chocolate')

% F) For each trial, take the mean fluorescence 0-10s after pellet
% consumption (one scalar for each trial).

chocAVG = mean(chocoMat(:,21:30),2);
sucrAVG = mean(periAllEvents2([1 2 5 6 7 8 10],21:30),2);

% G) Compare the mean fluorescence per eating trial between the two types
% of pellets. Is there a significant difference?
% For a two sample t-test, use the command:
% [h,p] = ttest2()

[h,p] = ttest2(chocAVG,sucrAVG)






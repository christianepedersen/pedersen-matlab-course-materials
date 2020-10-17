% MatLab Problem Set = Due Monday April 20 2020
% By Christian Pedersen

clear all  % clears all variables
close all  % closes all figures
clc    % clears command window


%% Here i generate fake photometry data for us to practice with

% loading in example data
load('stockreturns.mat');
temp1 = stocks';
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


%% Question 1  
% Make a 1 dimensional matrix called 'fives' that contains the elements 5,
% 10, 15, 20 ... 100 by using the colon operator

fives = 5:5:100


%% Question 2
% Use matrix multiplication (not element by element) to multiply matrix A
% and matrix B

A = [1 2 3]
B = [3 4;5 6;7 8]

C = A*B


%% Question 3
% Take the matrix transpose of matrix B and do element by element
% multiplication of A and B.T

A = [1 2 3]
B = [3;5;7]

C = A.*B'


%% Question 4
% Use the provided variables channel470 and channel405 for these problems

% A) calculate a new variable 'subtracted' that is channel470 minus 
% channel405 (this is done to remove motion artifacts present in both
% channels. the 405nm channel changes only with artifacts since the 
% fluorophore is not sensitive to calcium concentration)

subtracted = channel470-channel405; %note: these matrices are the same size

% B) find the mean and standard deviation of the variable subtracted

mean(subtracted);

std(subtracted);

% C) divide every element of subtracted by 10

subtDiv10 = subtracted./10;

% Challenge D) Find the 30th percentile fluorescence value of the variable
% subtracted. Hint: use the "sort" command

low2high = sort(subtracted,'ascend');

thirtyPercentile = low2high(round(0.3*length(low2high)))


%% Question 5
% Use the provided variables channel470 and channel405 for these problems

% A) deltaF/F is a common way of normalizing photometry data (1 dimensional
% time series). It is generally defined as:
% (each sample - mean(all samples)) / mean(all 470 nm samples)

% Calculate the deltaF/F of the variable subtracted

dFF_subtracted = (subtracted-median(subtracted))./mean(channel470);

% NOTE to stop problem session and discuss what a z score is.
% Challenge B) z score your subtracted photometry timeseries

z_subtracted = (subtracted-mean(subtracted))./std(subtracted);

% Challenge C) Use "min-max" normalization to make all your subtracted time
% series samples rescaled from 0 to 1. Plot to confirm range is 0 to 1.

minmax_subtracted = (subtracted - min(subtracted))./range(subtracted);

%% Question 6
% Use the provided matrix temp1 for this question
% temp1 is a 2 dimensional matrix that has 10 rows and 100 columns

% A) Find the maximum value of each column of the matrix 'temp1'

column_maxs = max(temp1,[],1);

% Very Hard Challenge B) Set the maximum value of each column of matrix temp1 
% to 1000 Hint: there are multiple ways to do this, but i recommend
% using the 'find' command or using a for loop + if, then statement

temp2 = temp1;

[~,maxIDX] = max(temp1,[],1);

for p = 1:size(temp1,2)
    
   temp2(maxIDX(p),p) = 1000;
    
end

% check that all the new maximums are 1000
column_maxs2 = max(temp2,[],1)

%% NOTE to stop the problem session and discuss the dimensonality of 
% neuroscience data sets. Photometry = 1 dim time series. Frames = 2 dim
% matrix of pixel values. Calcium imaging data = 3 dimensions, unique
% frames for each time step (frame rate).


%% Question 7
calciumImagingData = temp1 + 100;
% Let's say that 'calciumImagingData' is a 2 dimensional matrix generated
% from a single neuron-resolution calcium imaging experiment. Let's say
% each row corresponds to a different neuron (10 neurons) and each column
% corresponds to a different sample of fluorescence (100 frames).
% Assume we imaged the calcium dynamics of these neurons at a
% framerate of 5 frames per second.


% A) plot the fluorescence of every neuron between 10 and 15 seconds using
% the 'imagesc' command. This type of plot is usually known as a 'single 
% neuron fluorescence heatmap'.

figure()
imagesc(linspace(10,15,26),1:10,calciumImagingData(:,50:75))
xlabel('Time (s)')
ylabel('Individual Neurons')

% B) Find and plot the average fluorescence of all neurons combined between
% 5 and 10 seconds.

figure()
plot(linspace(5,10,26),mean(calciumImagingData(25:50),1))
xlabel('Time (s)')
ylabel('Average Fluorescence')

% Challenge C) Isolate the 8th neuron in 'calciumImagingData' as a new 1
% dimension time series called 'eighthCell'. Rearrange
% it to have 1 second duration time bins that contain the mean 
% fluorescence of 5 frames, rather than having a fluorescence measurement
% for every frame. Plot the single neuron's fluorescence as sampled 5 times
% a second and 1 times a second side by side.

eighthCell = calciumImagingData(8,:);

binned_fluorescence = NaN(1,20);

for p = 1:length(binned_fluorescence)

   temp_5frames = eighthCell((5*(p-1)+1):(5*p));
   
   binned_fluorescence(p) = mean(temp_5frames);
    
end    

figure()
plot(5:5:100,binned_fluorescence,'',1:100,eighthCell,'')
legend('1 Hz','5 Hz')
xlabel('Frames')
ylabel('Fluorescence')


%% Challenge Question 8
threeDimMat = rand(100,50,20);
% For a real challenge use a for loop within a for loop within a for loop
% to add 5 to each element of the 3D matrix 'threeDimMat' one element at a
% time. Hint: you will need to use triple indexing -> threeDimMat(n,k,p)


threeDimPlus5 = threeDimMat;

for p = 1:size(threeDimMat,3)

    for k = 1:size(threeDimMat,2)
    
        for n = 1:size(threeDimMat,1)

            threeDimPlus5(n,k,p) = threeDimMat(n,k,p) + 5;

        end

    end

end




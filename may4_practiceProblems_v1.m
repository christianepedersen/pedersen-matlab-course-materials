% MatLab Problem Set = Due Monday May 4 2020
% Corresponds to week 5 of Coursera Vanderbilt MatLab Course
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


%% Question 1: Creation of homogeneous matrices


a = zeros(3,4)

%b = NaN(3,4)

%c = []


% A) create a 3 row, 5 column matrix of zeros



% B) Create two matrices of ones that are 4x4 and subtract them to
% effectively make a matrix of zeros.



% C) Create a 2 dimensional matrix that contains 10,000 elements where
% every element is equal to 3.1415. (Hint: multiply a scalar with a
% homogeneous matrix)



% D) Create a matrix of random numbers ranging from 0 to 5 and add this matrix
% to the above matrix from C. What is the overall mean, min and max
% of this matrix?




%% Question 2: Adding noise to photometry data

% Note: in signal processing, random variables are often considered "white
% noise" because they have no underlying signal determining their variance.
% As signals become more noisey, the values become more randomly
% distributed.

% A) Use the 'histogram()' command to plot a histogram of the values in
% the raw470 photometry data provided. Specify 30 bins for the histogram plot.

figure()
histogram(raw470,30)

% B) Use the rand command to generate a random matrix the same size as the
% raw470 timeseries. Scale each element of this random matrix by a factor 
% of 70. Add this random matrix to the raw470 timeseries.

noise = 70*rand(1,length(raw470));
noisey470 = raw470+noise;

% C) Generate a line plot of the raw470 timeseries and the newly generated
% noisier timeseries. How do these signals look different?

figure()
plot(1:1800,raw470,'',1:1800,noisey470,'')
legend('470nm','470nm+noise')

% D) Plot a 30 bin histogram of the new photometry timeseries with the added
% noise. Compare this distribution of values to the histogram of the raw470
% signal. How do they look different?

figure()
histogram(noisey470,30)

%% Question 3: Visualizing and quantifying dopamine neuron activity during 
% sucrose pellet consumption.

load('periPelletMat1.mat')

% The above code loads a 2 dimensional matrix variable 'periAllEvents'.
% The rows of this matrix correspond to the photometry signal of dopamine
% neurons while an animal consumes a sucrose pellet. The 10 rows correspond
% to the 10 pellet eating bouts in a signal 30 minutes session. The rows
% are in chronological order (i.e. the third row is the third time the animal
% ate a pellet in the session). The 40 columns correspond to fluorescence 
% measurements each second from 20 seconds before the onset of eating to 
% 20 seconds after.


% A) Use the imagesc() command to plot a heatmap of every pellet eating
% bout from -20 seconds to + 20 seconds.

figure()
imagesc(linspace(-20,20,40),1:10,periAllEvents)

% B) 'Slice' the periAllEvents matrix and plot a heatmap of every pellet
% eating bout from -10 seconds to +10 seconds.
figure()
imagesc(linspace(-10,10,20),1:10,periAllEvents(:,11:30))

% C) Find the mean fluorescence for each pellet consumption epoch
% (i.e. one scalar value for each row of periAllEvents). Choose a peri-event
% time interval that is appropriate.
epochAVG = mean(periAllEvents(:,21:30),2);


% D) Plot the mean fluorescence for each pellet consumption epoch, where
% the x axis is epoch # and the y axis is the mean fluorescence per pellet
% epoch. Is there a trend in the magnitude of dopamine neuron activity
% across subsequent pellet eating epochs?

figure()
plot(1:10,epochAVG)

% E) Use the '[h,p] = corr()' command to find the Pearson's correlation between
% trial # and mean fluorescence per pellet epoch.

[r,p] = corr([1:10]',epochAVG)

% F) As a neuroscientist, how do you interpret the trend quantified above?









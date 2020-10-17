% MatLab Problem Set = Due Monday April 27 2020
% Corresponds to week 4 of Coursera Vanderbilt MatLab Course
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


%% Question 1: Photometry artifact subtraction  

% Create a new function that subtracts the raw 405nm channel timeseries 
% from the raw 470nm channel timeseries and plots the two starting
% timeseries and the subtracted timeseries on the same plot.
% Use the raw timeseries variables as input and get the subtracted 
% timeseries variable as output. Run you function by calling it from
% this script in the space below.


[subtracted] = question1_subtract405(raw470,raw405);

plot(1:1800,subtracted,'',1:1800,raw470,'',1:1800,raw405,'')
legend('subtr','470','405')


%% Question 2: Photometry Baseline Drift Correction

% Baseline drift is often observed in photometry data due to photobleaching
% effects over the course of the recording session, for this question we
% will correct for this baseline drift to make our photometry timeseries
% have a constant (flat) baseline.

% Create a new function that fits a curve to the subtracted timeseries,
% then subtracts the fitted curve from the photometry timeseries. The
% result should produce a photometry timeseries with a flatter baseline.
% Use the resulting photometry timeseries from question 1 as your input.
% The baseline corrected timeseries variable should be the output.
% Plot the photometry timeseries before baseline correction and the fitted
% curve in the same plot. Also plot the final baseline correction
% photometry timeseries. Adjust the parameters of your curve fitting to
% choose the most appropriate approximation of baseline drift. 
% Call the function in the space below.

% Hint: Use the commands polyfit() and polyval() to fit a curve to the
% input photometry timeseries. I recommend googling these commands and
% examples of their use.

polyOrder = 2; %specify 2nd order polynomial fit. y = a*x^2 + b*x + c

[BLC_series] = question2_baselineCorrect(subtracted,polyOrder);


%% Question 3: Photometry Timeseries Normalization

% deltaF/F normalization puts timeseries into terms of "percent change from
% baseline". It is calculated as:
% (each sample - median(all samples))/median(all raw 470 samples)

% z score normalization puts timeseries into terms of "standard deviations
% of change from baseline". It is calculated as:
% (each sample - mean(all samples))/standarddeviation(all samples)

% Create a new function that calculates the deltaF/F and z score for a
% given time series using the provided formulas. The input of this function
% should be a (motion artifact and baseline drift corrected) timeseries.
% The output should be two separate variables, one being the deltaF/F 
% timeseries and the other being the z scored timeseries. The function
% should also plot the input timeseries, the deltaF/F timeseries and the
% z scored timeseries. Call the function in the space below.

[dFF_series,Z_series] = question3_timeseriesNorm(BLC_series,raw470);


%% Challenge Question 4: Isolating Peri-event Fluorescence

% To understand how neural activity is changing during behavior, we
% generally are not interested in visualizing a plot of all the activity
% in a given recording session simultaneously; we may want to observe
% activity that is happening only during specific behavioral epochs.
% Here we will isolate a time window around when an animal is eating a 
% sucrose pellet, and plot only that particular epoch.

% Create a new function that takes in an entire session long timeseries
% (preferably one that has been preprocessed and is in terms of deltaF/F
% or z score) and isolates a time window of fluorescence surrounding when
% the animal eats a sucrose pellet at 360 seconds into the session. The
% inputs of your function should be the whole session time series and a
% variable called 'timewindow' which is a single element scalar that
% determines how long before and after the event we want to visualize the 
% peri-event fluorescence (ex: a timewindow that goes from 20 seconds
% before pellet consumption to 20 seconds after). The output of this
% function should be a truncated timeseries of fluorescence around the
% behavioral event.
% Call the function in the space below for different timewindow values and
% plot each truncated fluorescence window.

% Hint: the key to this is using matrix indexing. You can use variables to
% specify the indices you want (ex: data_subset = data(startindex:endindex))


[periSingleEvent] = question4_singlePeriEvent(Z_series,360);



%% Extra Challenge Question 5: Average Peri-event Fluorescence

% Times (in seconds) the animal eats tasty sucrose pellets
pelletEatTimes = [360 533 850 1112 1559];

% Create a new function that takes multiple behavioral event timestamps and
% a photometry timeseries (preferably one that has been preprocessed and
% is in terms of deltaF/F or z score) and isolates timewindows of
% fluorescence for each behavioral event timestamp. Then stack these
% peri-event fluorescence timewindows into a two-dimensional matrix where
% each row corresponds to a different peri-event timewindow and each column
% corresponds to a fluorescence sample (given data is 1 sample per second).
% Then take the mean of the 2-dimensional matrix to give the average
% fluorescence across all events. Plot the resulting average peri-event
% fluorescence. The outputs of the function should be the 2dimensional
% peri-event matrix and the 1 dimensional average peri-event fluorescence
% timeseries. Five behavioral time stamps are provided above and they
% correspond to the 1800 second duration example photometry data. Call the
% function in the space below.

[periAllEvents] = question5_allPeriEvent(Z_series,pelletEatTimes);

figure()
imagesc(linspace(-20,20,40),1:5,periAllEvents)
xlabel('Time (s)')
ylabel('Pellet Eating Bout')
colorbar;
%cbar('Z score')

periPelletAVG = mean(periAllEvents,1);

figure()
plot(linspace(-20,20,40),periPelletAVG)
xlabel('Time (s)')
ylabel('Mean Fluorescence (z score)')















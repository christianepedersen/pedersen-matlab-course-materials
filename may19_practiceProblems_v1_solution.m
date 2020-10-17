% MatLab Problem Set = Due Tuesday May 19 2020
% Corresponds to week 7 of Coursera Vanderbilt MatLab Course
% By Christian Pedersen

clear all  % clears all variables
close all  % closes all figures
clc    % clears command window


%% Here I load in example photometry data to practice with

% loading in example data
load('example_photom_1Hz.mat')

% Instructions: A time series is a 1 dimensional matrix that has a single
% value (element) for each time step. For the sake of these exercises, we
% will use the time series generated above, raw470 and raw405. Each element
% corresponds to 1 fluorescence sample per second. Use these variables
% to answer the below questions to the best of your abilities. Also, feel 
% free to google stuff like "matlab how to find length of a variable" if 
% you get stuck. 



%% Question 1: Flagging values above a threshold

% Say we want to find when a photometry time series exceeds a certain
% threshold of fluorescence. In this question, we will use a for loop and a
% if,then statement to flag fluorescence samples that exceed a threshold. 

% First, create a boolean array (only 0's and 1's) that is the same size as
% the raw470 variable. This boolean array should initially contain only zeros
% Name this variable 'flagHigh'.

flagHigh = zeros(size(raw470));

% Use a for loop and a if,then statement within the loop to test whether
% each element of raw470 is greater than 140. If it is for that particular
% element, then set the corresponding element of flagHigh equal to 1.

threshold = 140;

for p = 1:length(flagHigh)
    
    if raw470(p) > threshold
    
        flagHigh(p) = 1;
        
    end
    
end

% Now that we have a subset of our 1800 elements flagged as being above the
% threshold, use conditional logic to find the percentage of elements in
% raw470 that are above the threshold value of 140.

percentHigh = 100*length(flagHigh(flagHigh==1))/length(flagHigh);
percentHigh = 100*sum(flagHigh)/length(flagHigh)


%% Question 2: Manually downsample by averaging


% Take the provided 'raw470' time series and find the average of every 10
% elements, effectively downsampling the time series so that we have a
% measurement every 10 seconds, instead of 1 second. The resulting 1
% dimensional matrix should be 180 elements long instead of 1800.
% Use a for loop to accomplish this.


tenSecAVG = NaN(1,length(raw470)/10);

for p = 1:length(tenSecAVG)

   temp_10sec = raw470((10*(p-1)+1):(10*p));
   
   tenSecAVG(p) = mean(temp_10sec);
    
end    

% Plot the original 1 Hz sample rate time series along side the newly
% created 0.1 Hz sample rate time series.

figure()
plot(1:1800,raw470,'',10:10:1800,tenSecAVG,'')
legend('1 Hz','5 Hz')
xlabel('Frames')
ylabel('Fluorescence')

% Zoom into the graph and look at how the 1 Hz and 0.1 Hz timeseries
% differ. What do you notice about the signals?



%% Question 3: Nested for loops with multiple dimensions

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

% Take the global mean ( mean(var,'all') ) of the initial 3D random matrix
% and the resulting 3D matrix after adding 5 to each element. The means
% should be different by 5.

mean(threeDimMat,'all')

mean(threeDimPlus5,'all')






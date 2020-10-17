function [dFF_series,Z_series] = question3_timeseriesNorm(BLC_series,raw470)


% deltaF/F normalization puts timeseries into terms of "percent change from
% baseline". It is calculated as:
% (each sample - median(all samples))/median(all raw 470 samples)

dFF_series = (BLC_series - median(BLC_series))/median(raw470);


% z score normalization puts timeseries into terms of "standard deviations
% of change from baseline". It is calculated as:
% (each sample - mean(all samples))/standarddeviation(all samples)

Z_series = (BLC_series - mean(BLC_series))/std(BLC_series);


figure()
plot(1:1800,dFF_series,'',1:1800,Z_series,'')
legend('dFF','Z score')

end
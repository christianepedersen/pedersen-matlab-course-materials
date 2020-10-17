function [BLC_series] = question2_baselineCorrect(subtracted,polyOrder)


fitCoefficients = polyfit(1:1800,subtracted,polyOrder);


fitcurve = polyval(fitCoefficients,1:1800);


BLC_series = subtracted - fitcurve;


figure()
plot(1:1800,subtracted,'',1:1800,fitcurve,'',1:1800,BLC_series,'')
legend('Original','Fit Curve','BL Corrected')
xlabel('Samples (1 Hz)')

end
function [periSingleEvent] = question4_singlePeriEvent(Z_series,timestamp)


startidx = timestamp - 20;
endidx = timestamp + 19;

periSingleEvent = Z_series(startidx:endidx);

figure()
plot(Z_series)


figure()
plot(linspace(-20,20,length(periSingleEvent)),periSingleEvent)

end
function [periAllEvents] = question5_allPeriEvent(Z_series,timestamps)


    for p = 1:length(timestamps)

    startidx = timestamps(p) - 20;
    endidx = timestamps(p) + 19;

    periSingleEvent = Z_series(startidx:endidx);

    periAllEvents(p,:) = periSingleEvent;
    
    end

end
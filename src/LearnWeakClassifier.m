function [theta, p, err] = LearnWeakClassifier(ws, fs, ys)
    % ws är rad
    % fs är kolumn
    % ys är kolumn
    
    wf = ws.*fs';   
    theta = 0.5*((wf*ys./(ws*ys))+(wf*(1-ys)./(ws*(1-ys))));    
    
    eneg = ws*abs(ys - (fs  > theta));
    epos = ws*abs(ys - (fs  < theta));    
    if eneg < epos
        p = -1;
        err = eneg;
    else
        p = 1;
        err = epos;
    end
    
end


function [theta, p, err] = LearnWeakClassifier(ws, fs, ys)
    % ws är rad
    % fs är kolumn
    % ys är kolumn
    
    wf = ws.*fs';    
    myp = wf*ys./(ws*ys);
    myn = wf*(1-ys)./(ws*(1-ys));
    theta = 0.5*(myp+myn);    
    %eneg = ws*abs(ys - (-fs  < -theta ));
    %epos = ws*abs(ys - (fs  < theta ));    
    
    eneg = ws*abs(ys - h(fs, -1, theta) );
    epos = ws*abs(ys - h(fs, 1, theta) );    
    if eneg < epos
        p = -1;
        err = eneg;
    else
        p = 1;
        err = epos;
    end
    
end


function dets = ScanImageOverScale(Cparams, im, min_s, max_s, step_s)
    dets = [];
    for i = min_s:step_s:max_s
        imp = imresize(im,i);
        detsp = ScanImageFixedSize(Cparams, imp);        
        dets = [dets;floor(detsp/i)];
    end


end



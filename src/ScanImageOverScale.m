function dets = ScanImageOverScale(Cparams, im, min_s, max_s, step_s)
    dets = [];
    if ndims(im) > 2
        im = rgb2gray(im);
    end
    for i = min_s:step_s:max_s
        imp = imresize(im,i);
        detsp = ScanImageFixedSize(Cparams, imp);        
        dets = [dets;floor(detsp/i)];
    end


end



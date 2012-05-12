function dets = ScanImageFixedSize(Cparams, im)
    if ndims(im) > 2
        im = rgb2gray(im);
    end
    im = double(im);    
    
    imsqr = im.*im;    
    ii_im = cumsum(cumsum(im),2);
    ii_imsqr = cumsum(cumsum(imsqr),2);
    
    
    L = 19;
    step = 2;
    dets = [];
    for x = 1 : step :size(im,2) - L
        for y = 1:step: size(im,1) -L            
            my = 1/(L*L)*ComputeBoxSum(ii_im,x,y,L,L);    
            sigma = sqrt( (1/(L*L -1) )*(ComputeBoxSum(ii_imsqr,x,y,L,L) - L*L*my*my));           
            sc = ApplyDetector(Cparams,ii_im(y:y+L-1,x:x+L-1),sigma,my);
            
            if sc > 7
                dets = [dets;x,y,L,L];
            end
        end
    end   
end


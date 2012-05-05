function dets = ScanImageFixedSize(Cparams, im)
    if ndims(im) > 2
        im = rgb2gray(im);
    end
    im = double(im);    
    
    imsqr = im.*im;    
    ii_im = cumsum(cumsum(im),2);
    ii_imsqr = cumsum(cumsum(imsqr),2);
    
    
    L = 19;
    
    dets = [];
    for x = 1 : size(im,2) - L
        for y = 1: size(im,1) -L            
            my = 1/(L*L)*computeBoxSum(ii_im,x,y,L,L);    
            sigma = sqrt( (1/(L*L -1) )*(computeBoxSum(ii_imsqr,x,y,L,L) - L*L*my*my));           
            sc = ApplyDetector(Cparams,ii_im(y:y+L-1,x:x+L-1),sigma,my);
            if sc > 8
                dets = [dets;x,y,L,L];
            end
        end
    end
   max(sc) 
end


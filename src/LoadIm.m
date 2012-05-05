function [im,ii_im] = LoadIm(im_fname)    
    im = double(imread(im_fname));    
    im_v = im(:);
    my = mean(im_v); 
    sigma = std(im_v);
    if sigma == 0
        sigma = 0.00001;
    end
    im = (im-my)/sigma;
    ii_im = cumsum(cumsum(im),2);
end

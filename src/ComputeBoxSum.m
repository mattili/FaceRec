function A = ComputeBoxSum(ii_im, x, y, w, h)
% Computes intensities of box given correct input. >:[
    if x == 1 && y == 1
         A = ii_im(y+h-1, x+w-1);
    elseif x == 1 
         A = ii_im(y+h-1, x+w-1)  - ii_im(y-1, x+w-1);    
    elseif y == 1
         A = ii_im(y+h-1, x+w-1) - ii_im(y+h-1, x-1);
    else
         A = ii_im(y+h-1, x+w-1) - ii_im(y+h-1, x-1) - ii_im(y-1, x+w-1) + ii_im(y-1, x-1);
    end
        
    
end
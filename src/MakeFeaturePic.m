function fpic = MakeFeaturePic(ftype, W, H)
    n = ftype(1);
    x = ftype(2);
    y = ftype(3);
    w = ftype(4);
    h = ftype(5);
    fpic = zeros(H,W);
    
    switch n
        case 1  
            fpic(y:h+y-1, x:w+x-1) = -ones(h,w); % VecBoxSum(x,y,w,h) 
            fpic(y+h:2*h+y-1, x:w+x-1) = ones(h,w); %-  VecBoxSum(x,y+h,w,h) ;
        case 2
            fpic(y:y+h-1, x+w:x+2*w -1) = -ones(h,w); %  VecBoxSum(x+w,y,w,h)
            fpic(y:y+h-1, x:x+w -1) = ones(h,w);    %  - VecBoxSum(x,y,w,h);
        case 3
            fpic(y:y+h-1, x+w:x+2*w -1) = -ones(h,w); %VecBoxSum(x+w,y,w,h) 
            fpic(y:y+h -1, x+2*w:x+3*w -1) = ones(h,w); % - VecBoxSum(x+2*w,y,w,h) 
            fpic(y:y+h-1, x:x+w -1) = ones(h,w); % - VecBoxSum(x,y,w,h) ;
        case 4
            fpic(y:y+h -1, x+w:x+2*w -1) = -ones(h,w); %VecBoxSum(x+w,y,w,h)
            fpic(y+h:y+2*h-1, x:x+w -1) = -ones(h,w); %VecBoxSum(x,y+h,w,h) 
            fpic(y+h:y+2*h-1, x+w:x+2*w -1) = ones(h,w); %-VecBoxSum(x+w,y+h,w,h) 
            fpic(y:y+h-1, x:x+w -1) = ones(h,w); %-VecBoxSum(x,y,w,h);
        otherwise
            %error
    end
end


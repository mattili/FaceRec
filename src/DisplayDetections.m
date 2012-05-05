function DisplayDetections(im, dets)
    imshow(im);
    hold on;
    for i = 1 : size(dets,1)
        x = [dets(i,1),dets(i,1)+dets(i,3),dets(i,1)+dets(i,3),dets(i,1),dets(i,1)];
        y = [dets(i,2),dets(i,2),dets(i,2)+dets(i,4),dets(i,2)+dets(i,4),dets(i,2)];        
        plot(x,y,'r')
    end

end


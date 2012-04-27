function fs = ComputeFeature(ii_ims, ftype)
n = ftype(1);
x = ftype(2);
y = ftype(3);
w = ftype(4);
h = ftype(5);
[ims,~] = size(ii_ims);

fs = ones(1,ims);
for i=1:ims
    im = ii_ims{i};
    if n == 1
        fs(i) = FeatureTypeI(im,x,y,w,h);
    elseif n == 2
        fs(i) = FeatureTypeII(im,x,y,w,h);
    elseif n == 3
        fs(i) = FeatureTypeIII(im,x,y,w,h);
    elseif n == 4
        fs(i) = FeatureTypeIV(im,x,y,w,h);
    else 
        %error.
    end
end


end


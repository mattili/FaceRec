eps = 1e-06;
%program 1
[im,ii_im] = LoadIm('TrainingImages/FACES/face00001.bmp');
dinfo1 = load('DebugInfo/debuginfo1.mat');
s1 = sum(abs(dinfo1.im(:) - im(:)) >eps);
s2 = sum(abs(dinfo1.ii_im(:) - im(:)) >eps);



% Laddar in de 100 första bilderna
mystr = ['TrainingImages/test', '/*.bmp'];
im_files = dir(mystr);
ni = length(im_files);
ii_ims1 = cell(ni, 1);
addpath('TrainingImages/test');


W = 19;
H = 19;

all_ftypes = EnumAllFeatures(W,H);
fmat = VecAllFeatures(all_ftypes,W,H);

ii_ims = zeros(ni,W*H);
for i=1:ni
    [a,b] = LoadIm(im_files(i).name);
    ii_ims(i,:) = b(:);
    ii_ims1{i} = b;     
end




%program 12 
fs1 = VecComputeFeature(ii_ims, fmat(:, 1));
fs2 = ComputeFeature(ii_ims1, all_ftypes(1,:))';
sum(fs1-fs2>eps)





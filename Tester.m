eps = 1e-06;
%program 1
[im,ii_im] = LoadIm('TrainingImages/FACES/face00001.bmp');
dinfo1 = load('DebugInfo/debuginfo1.mat');
s1 = sum(abs(dinfo1.im(:) - im(:)) >eps)
s2 = sum(abs(dinfo1.ii_im(:) - ii_im(:)) >eps)



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



%program 13-14
dirname = 'TrainingImages/FACES';
dinfo4 = load('DebugInfo/debuginfo4.mat');
ni = dinfo4.ni;
all_ftypes = dinfo4.all_ftypes;
im_sfn = 'FaceData.mat';
f_sfn = 'FeaturesToMat.mat';
stream = RandStream('mt19937ar','seed', dinfo4.jseed);
RandStream.setDefaultStream(stream);
LoadSaveImData(dirname, ni, im_sfn);
ComputeSaveFData(all_ftypes, f_sfn);

facedata = load(im_sfn);
feattomat = load(f_sfn);
sl1 = sum(sum(abs(dinfo4.ii_ims - facedata.ii_ims) >eps))
sl2 = sum(sum(abs(dinfo4.fmat - feattomat.fmat) >eps))




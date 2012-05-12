%matlabpool open local 4
tic
Cparams = BoostingAlg(Fdata, NFdata, FTdata, 100)
toc
%matlabpool close
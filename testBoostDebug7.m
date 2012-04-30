dinfo7 = load('DebugInfo/debuginfo7.mat');
T = dinfo7.T;
Cparams = BoostingAlg(Fdata, NFdata, FTdata, T);
sum(abs(dinfo7.alphas - Cparams.alphas)>eps)
sum(abs(dinfo7.Thetas(:) - Cparams.Thetas(:))>eps)

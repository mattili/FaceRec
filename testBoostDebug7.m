dinfo7 = load('DebugInfo/debuginfo7.mat');
T = dinfo7.T;
eps = 1e-06;
Cparams = BoostingAlg(Fdata, NFdata, FTdata, T);
sum(abs(dinfo7.alphas - Cparams.alphas)>eps)
sum(abs(dinfo7.Thetas(:) - Cparams.Thetas(:))>eps)

%    -3.1534
%   -13.9134
%   -10.8880
%    -6.5427
%    15.2994
%    11.4484
%     5.9016
%     4.9930
%    -6.0876
%    -4.9813
%   -15.4181
%   -11.3661
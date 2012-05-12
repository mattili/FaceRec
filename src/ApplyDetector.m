function sc = ApplyDetector(Cparams, ii_im, sigma,my)
    if nargin < 3
        sigma = 1.0;
        my = 1.0;
    end
        
    
    im = ii_im(:)';    
    idxs = Cparams.Thetas(:,1);    
    fs = im*Cparams.fmat(:,idxs);    
    fs = fs + 19*19*my*(Cparams.all_ftypes(idxs,1) == 3)';      
    fs = fs./sigma;
    
    sc = Cparams.alphas'*(Cparams.Thetas(:,3)'.*fs < Cparams.Thetas(:,3)'.*Cparams.Thetas(:,2)')';    
end


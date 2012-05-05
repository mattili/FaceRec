function sc = ApplyDetector(Cparams, ii_im, sigma,my)
    if nargin < 3
        sigma = 1.0;
        my = 1.0;
    end
    
    fs = ii_im(:)'*Cparams.fmat(:,Cparams.Thetas(:,1) ) ;    
    fs = zeros(1,size(Cparams.Thetas,1));
    for i = 1 : size(Cparams.Thetas,1)
        idx = Cparams.Thetas(i,1);
        fs(i) = ii_im(:)'*Cparams.fmat(:,idx);
        if Cparams.all_ftypes(idx,1) == 3
             fs(i) = fs(i) + 19*19*my;            
        end
        fs(i) = fs(i)./sigma;
    end
    
    sc = Cparams.alphas'*h(fs, Cparams.Thetas(:,3)',Cparams.Thetas(:,2)')';    
end


function sc = ApplyDetector(Cparams, ii_im)
    fs = ii_im(:)'*Cparams.fmat(:,Cparams.Thetas(:,1) ) ;
    sc = Cparams.alphas'*h(fs,Cparams.Thetas(:,3)',Cparams.Thetas(:,2)')';    
end


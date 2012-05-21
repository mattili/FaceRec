function testBoosting(T,Fdata,NFdata,FTdata)

    if 0
        Cparams = BoostingAlg(Fdata, NFdata, FTdata, T);    
    else
        load('cpar');        
    end
    
    
    chosen_f = ones(1,T);
    ps = Cparams.Thetas(:,3);
    
    W = FTdata.W;
    H = FTdata.H;
    
    figure(1);
    colormap(gray);    
    
    for i=1:T
        j = Cparams.Thetas(i,1);
        chosen_f(i) = j;
        subplot(1,T+1,i);
        imagesc(MakeFeaturePic(Cparams.all_ftypes(j,:), W, H));
        axis image;
    end
        

    
    subplot(1,T+1,T+1);
    cpic = MakeClassifierPic(Cparams.all_ftypes, chosen_f, Cparams.alphas, ps, W, H);
    imagesc( cpic ); 
    axis image
end
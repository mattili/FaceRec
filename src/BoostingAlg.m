function Cparams = BoostingAlg(Fdata, NFdata, FTdata, T)

    all_ims = [Fdata.ii_ims; NFdata.ii_ims];
    fmat = FTdata.fmat;
    
    n = length(Fdata.ii_ims) + length(NFdata.ii_ims);
    m = length(NFdata.ii_ims);
    
    y = [ones(n-m,1);zeros(m,1)];
    
    wf = (1/(2*(n-m)))*ones(1,n-m);
    wnf = (1/(2*m))*ones(1,m);
    
    w = zeros(T,n);
    w(1,:) = [wf,wnf];    
    
    Thetas = zeros(T,3);
    
    alphas = zeros(T,1);
    for i=1:T
        % normalize w
        w(i,:) = w(i,:)/sum(w(i,:));
        
        thet=0;
        par = 1;
        error = inf;
        best_j = -1;
        best_fs = zeros(size(fmat,1),1);
        for j = 1: size(fmat,2)
            fs = all_ims*fmat(:,j);
            [theta,p,err] = LearnWeakClassifier(w(i,:),fs,y);
            if err < error
                best_fs = fs;
                best_j = j;
                error = err;
                par = p;
                thet = theta;
            end            
        end
        Thetas(i,:) = [best_j,thet,par];        
        beta = error/(1-error);  
        
        if i ~= T            
            w(i+1,:) = w(i,:).*(beta.^(1-abs(h(best_fs,par,thet) -y ) ))';            
        end        
        
        alphas(i,:) = log(1/beta);                
    end
    
    
    Cparams = struct('alphas',alphas,'Thetas',Thetas,'fmat',fmat, 'all_ftypes',FTdata.all_ftypes);
    
end


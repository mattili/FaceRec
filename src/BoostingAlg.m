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
    %precalc all fs    
    all_fs = all_ims*fmat;
    
    all_thets_for_i = zeros(size(fmat,2),3);
        
    for i=1:T
        % normalize w
        w(i,:) = w(i,:)/sum(w(i,:));
        tmp_w = w(i,:);
        
         for j = 1: size(fmat,2)
          [theta,p,err] = LearnWeakClassifier(tmp_w, all_fs(:,j) ,y);                    
          all_thets_for_i(j,:) = [theta,p,err];
        end        
        [error,best_j]  = min(all_thets_for_i(:,3));
      
        par = all_thets_for_i(best_j,2);
        thet = all_thets_for_i(best_j,1);
        best_fs = all_fs(:,best_j);
        
        Thetas(i,:) = [best_j, thet, par];
     
        beta = error/(1-error);
        if i ~= T            
            w(i+1,:) = tmp_w.*(beta.^(1-abs( h(best_fs,par,thet) -y ) ))';            
        end        
        
        alphas(i,:) = log(1/beta);                
    end
    
    
    Cparams = struct('alphas',alphas,'Thetas',Thetas,'fmat',fmat, 'all_ftypes',FTdata.all_ftypes);
    
end


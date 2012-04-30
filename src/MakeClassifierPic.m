function cpic = MakeClassifierPic(all_ftypes, chosen_f, alphas, ps, W, H)   
    cpic = zeros(H,W);
    for i = 1: length(chosen_f)
        cpic = cpic + alphas(i)*ps(i).*MakeFeaturePic(all_ftypes(chosen_f(i), :), W, H);
    end



end


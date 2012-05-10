function fdets = PruneDetections(dets)
    n = size(dets,1);
    D = zeros(n,n);
    for i = 1: n
        for j= i+1: n
            if i ~= j
                if rectint(dets(i,:),dets(j,:)) > 0
                    D(i,j) = 1;
                    D(j,i) = 1;
                    
                end
            end
        end
    end
    
    [S,C] = graphconncomp(sparse(D));
    S
    C
    fdets = zeros(S,4);
    for i = 1 : S
        c = 0;
        for j = 1 : n
            if C(j) == i
                fdets(i,:) = fdets(i,:) + dets(j,:);
                c = c+1;
            end
        end
        fdets(i,:) = floor(fdets(i,:)/c);
    end
    

end


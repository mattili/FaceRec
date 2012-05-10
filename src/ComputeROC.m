function ComputeROC(Cparams, Fdata, NFdata)
    %Prepare test images
    H = 19;
    W = 19;

    face_fnames = dir(Fdata.dirname);
    
    aa = 3:length(face_fnames);    
    test_im_num = setdiff(aa,Fdata.fnums);    
    ni = length(test_im_num);
    
    face_training = cell(ni, 1); % Really test .. :)
    
    for i = 1:ni
        im_fname = [Fdata.dirname, '/', face_fnames( test_im_num(i) ).name];
        [~, ii_im] = LoadIm(im_fname);
        face_training{i} = ii_im;
    end

    
    face_fnames = dir(NFdata.dirname);
    
    aa = 3:length(face_fnames);    
    test_im_num = setdiff(aa,NFdata.fnums);    
    ni = length(test_im_num);
    nface_training = cell(ni, 1);   
    
    for i = 1:ni
        im_fname = [NFdata.dirname, '/', face_fnames( test_im_num(i) ).name];
        [~, ii_im] = LoadIm(im_fname);
        nface_training{i} = ii_im;
    end
    
    fsize = length(face_training);
    nfsize = length(nface_training);
    all_im = [face_training;nface_training];
    
    score = zeros(fsize+nfsize,2);
    score(1:fsize,2) = 1;
    
    
    for i = 1 : length(score)
        score(i,1) = ApplyDetector(Cparams,all_im{i});
    end
    
    %theta = sum(Cparams.alphas)/2;
    
    min_theta = min(score(:,1))
    max_theta = max(score(:,1))    
    thets = min_theta:0.1:max_theta;
    tpr = zeros(length(thets),1);
    fpr = zeros(length(thets),1);
    found = 0;
    
    for i = 1 :length(thets)
        theta = thets(i);
        ntp = sum(( score(:,1) >= theta) & score(:,2));
        nfp = sum((score(:,1) >= theta) & ~score(:,2));
        ntn = sum(( score(:,1) < theta) & ~score(:,2));
        nfn = sum(( score(:,1) < theta) & score(:,2));

        tpr(i) = ntp/(ntp+nfn);
        fpr(i) = nfp/(ntn+nfp);
        if tpr(i) < 0.7 && ~found
            Cparams.thresh = theta;
            found = 1;   
        end
    
    end
    axis([-0.01,1.01,0,1.01])
    plot(fpr,tpr)
    Cparams.thresh    
    
end
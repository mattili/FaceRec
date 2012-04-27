function LoadSaveImData(dirname, ni, im_sfn)
    % Randomly pick ni images
    face_fnames = dir(dirname);
    aa = 3:length(face_fnames);
    a = randperm(length(aa));
    fnums = aa(a(1:ni));
    
    im = imread([dirname,'/',face_fnames(fnums(3)).name]);
    [h,w] = size(im);
    ii_ims = zeros(ni,h*w);
    for i = 1:ni
        im_fname = [dirname, '/', face_fnames(fnums(i)).name];
        [~, ii_im] = LoadIm(im_fname);
        ii_ims(i,:) = reshape(ii_im,1,h*w);
    end
    
    save(im_sfn, 'dirname', 'fnums', 'ii_ims');
end
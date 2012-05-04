
all_ims = [Fdata.ii_ims; NFdata.ii_ims];
fmat = FTdata.fmat;
fs = all_ims*fmat(:,12028);
y = [ones(2000,1);zeros(4000,1)];
w = (1/6000)*ones(1,6000);
[theta,p,err] =LearnWeakClassifier(w,fs,y);
theta
p
err

[ap bp] = hist(fs(y==1),10);
[an bn] = hist(fs(y==0),10);

clf
plot(bp,ap/sum(ap),'g')
hold on
plot(bn,an/sum(an),'r');
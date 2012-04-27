function all_ftypes = EnumAllFeatures(W, H)
% Program 7, assignment 2.3
% enumerate all features, output is nf * 5 where nf is the number of features

nf = 1;
% f1
s = floor(W*W*H*H/2);
all_ftypes = zeros(s,5);

for w = 1:W-2
    for h = 1:floor(H/2)-2
        for x = 2:W-w
            for y = 2:H-2*h
                all_ftypes(nf,:) = [1,x,y,w,h];
                nf = nf +1;
            end
        end
    end
end
%f2
for w = 1:floor(W/2)-2
    for h = 1:H-2
        for x = 2:W-2*w
            for y = 2:H-h
                all_ftypes(nf,:) = [2,x,y,w,h];
                nf = nf +1;
            end
        end
    end
end

%f3
for w = 1:floor(W/3)-2
    for h = 1:H-2
        for x = 2:W-3*w
            for y = 2:H-h
                all_ftypes(nf,:) = [3,x,y,w,h];
                nf = nf +1;
            end
        end
    end
end
%f4
for w = 1:floor(W/2)-2
    for h = 1:floor(H/2)-2
        for x = 2:W-2*w
            for y = 2:H-2*h
                all_ftypes(nf,:) = [4,x,y,w,h];
                nf = nf +1;
            end
        end
    end
end
all_ftypes = all_ftypes(1:nf-1,:);


end


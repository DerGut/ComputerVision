function [ binarized ] = binarize( img, threshold )
%BINARIZE Takes an input image and applies binarization on base of some
% threshold between 0 and 1

threshold = threshold * 255;
%binarized = boolean(zeros(size(img,1),size(img,2)));
binarized = boolean(zeros(size(img)));
for i = 1:size(img,1)
    for j = 1:size(img,2)
        if img(i,j) <= threshold
            binarized(i,j) = 0;
        else
            binarized(i,j) = 255;
        end
    end
end


end


function [ diff ] = difference( img1, img2 , threshold )
%DIFFERENCE Computes the difference of two images...
% applies a binarization in order to highlight the...
% regions in motion


% computes the difference
diff = abs(img2-img1);
% converts the difference image into a binary
diff = binarize(diff, threshold);




end


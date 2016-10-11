function [ histogram ] = colorchar( img )
%COLORCHAR Returns a histogram of the color values of img
%   Detailed explanation goes here

histogram = zeros(1,101);
imgH = uint8(img(:,:,1)*100);
[length width] = size(imgH);
for i=1:length-1
    for j=1:width-1
    histogram((imgH(i,j)+1)) = histogram((imgH(i,j)+1))+1;
    end
end
bar(histogram)
end


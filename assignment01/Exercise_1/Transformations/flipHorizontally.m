function [ flipped ] = flipHorizontally( img )
%FLIP_HORIZONTALLY Flips a given image around.. 
% the horizontal axis

imgHeight = size(img,1);
imgWidth = size(img,2);
flipped = zeros(imgHeight,imgWidth);
for i = 1:imgHeight
    for j = 1:imgWidth
        % copies pixels from the source image to...
        % the corresponding row of the same column in...
        % the 'flipped image'
        flipped(imgHeight-i+1,j) = img(i,j);
    end
end
flipped = uint8(flipped);


end


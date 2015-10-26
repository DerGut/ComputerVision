function [ flipped ] = flipVertically( img )
%FLIP_VERTICALLY flips a given image around the...
% vertical axis

imgHeight = size(img,1);
imgWidth = size(img,2);
flipped = zeros(imgHeight,imgWidth);
for i = 1:imgHeight
    for j = 1:imgWidth
        % copies pixels from the source image to...
        % the corresponding column of the same row in...
        % the 'flipped image'
        flipped(i,imgWidth-j+1) = img(i,j);
    end
end
flipped = uint8(flipped);


end


function [ img ] = markRegion( img , size, location )
%MARK_REGION Marks a previously defined region in the source image


% mask in given size, white pixels
region = ones(size(1), size(2))*255;

% attaches the mask to the original image
img(location(1):size(1)+location(1)-1, location(2):size(2)+location(2)-1)...
    = region;


end


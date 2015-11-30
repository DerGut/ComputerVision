function [ array ] = img2array( img )
%IMG_2_ARRAY Flattens an image into an array of dimensions size(img,1) *
%size(img,2) x size(img,3).

array = zeros(size(img,1) * size(img,2), size(img,3));
for row = 1:size(img,1)
    array( size(img,2)*row - size(img,2)+1:size(img,2)*row,:) = img(row,:,:);
end

end


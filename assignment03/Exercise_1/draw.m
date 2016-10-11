function [ path ] = draw( path, mask )
%DRAW Draws ontop of the image where the masks specifies it.

%paint = uint8(zeros(size(mask,1), size(mask,2), 3));
path(:,:,1) = path(:,:,1) + double(mask)*70;
path(:,:,2) = path(:,:,2) - double(mask)*50;
path(:,:,3) = path(:,:,3) - double(mask)*50;


end


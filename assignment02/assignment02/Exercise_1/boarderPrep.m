function [ boardered ] = boarderPrep( img, rOffset, cOffset )
%BOARDER_PREP Enlarges the image by half of the kernel size in each
%direction and sets the boarder values in reverse order of the adjacent
%pixels



% initializes an enlarged version of img with only zeros
boardered = zeros(size(img,1)+(rOffset*2), ...
    size(img,2)+(cOffset*2));

% copies pixels from img into center
boardered(1+rOffset:end-rOffset, 1+cOffset:end-cOffset) = img;

% rows
% copies pixels from first rows of the img in reverse order to the boarder
boardered(1:rOffset, 1+cOffset:end-cOffset) = img(rOffset:-1:1,:);
% copies pixels from last rows of the img in reverse order to the boarder
boardered(end-rOffset+1:end, 1+cOffset:end-cOffset) = ...
    img(end:-1:end-rOffset+1,:);

% columns
% copies pixels from first columns of the img in reverse order
%to the boarder
boardered(1+rOffset:end-rOffset, 1:cOffset) = img(:,cOffset:-1:1);
boardered(1+rOffset:end-rOffset, end-cOffset+1:end) = ...
img(:,end:-1:end-cOffset+1);

end


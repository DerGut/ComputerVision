function [ upsideDown ] = rotateUpsideDown( img )
%ROTATE_UPSIDE_DOWN Summary of this function goes here
%   Detailed explanation goes here

upsideDown = flipVertically(flipHorizontally(img));

end


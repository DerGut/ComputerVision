function [ right ] = rotateRight( img )
%ROTATE_RIGHT Rotates an image around 90degrees

right = flipHorizontally(img)';

end


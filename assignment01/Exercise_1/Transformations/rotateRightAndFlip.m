function [ rightFlip ] = rotateRightAndFlip( img )
%ROTATE_RIGHT_AND_FLIP Flips the image and...
% rotates it to the right


% three operations ---> IMPROVE
rightFlip = flipVertically(rotateLeft(img));

end


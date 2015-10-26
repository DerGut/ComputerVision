function [ leftRotation ] = rotateLeft( img )
%ROTATE_LEFT rotates the image left around 90degrees

leftRotation = flipVertically(img)';

end


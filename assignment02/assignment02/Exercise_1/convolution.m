function [ pixel ] = convolution( patch, kernel )
%CONVOLUTION Applies a convolution of the indicated kernel on the given
%image patch. Returns the pixel value computed by the convolution.

pixel = uint8(sum(sum(double(patch) .* kernel)));

end


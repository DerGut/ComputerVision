function [ out_img ] = gauss_noise( img, variance )
%GAUSS_NOISE attaches noise to an image

% generates a random pattern of values in
% the given variance
random = rand(size(img))*variance - variance/2;

% applies the noise pattern to the image
out_img = uint8(double(img) + random);

end


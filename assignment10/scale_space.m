function [ octaves ] = scale_space( I )
%SCALE_SPACE Computes the scale space of an image I by using a gaussian
%function

sigma_0 = 0.5;
k = sqrt(2);
octaves = {1,4};
for octave = 1:4
    image_size = size(I);
    L_array = zeros(image_size(1), image_size(2), 5);
    for scale = 0:4
        sigma = k^scale * sigma_0;
        kernel_size = ceil(4*sigma);
        Gaussian = fspecial('gaussian', kernel_size, sigma);
        L_array(:,:,scale+1) = imfilter(I, Gaussian);
    end
    octaves{1,octave} = L_array;
    I = L_array(1:2:end,1:2:end,3);
    
end


end


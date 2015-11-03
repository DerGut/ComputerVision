function [ img ] = gauss_noise( img, variance )
%GAUSS_NOISE attaches noise to an image

% generates a random pattern of values in
% the given variance
random = rand(size(img))*variance - variance/2;

% applies the noise pattern to the image
img = uint8(double(img) + random);



%% f(x) = (1/sqrt(2PI*sigma^2))e^-((x-mu)^2/(2sigma^2))
%mu = 0;
%array = zeros(size(img,1)*size(img,2));
%
%for x = 1:size(array)
%    array(x) = (1 / sqrt(2*pi*variance) ) * exp(-( (x-mu)^2 / (2*variance) ));
%end
%
%array = shuffle(array);
%
%for i = 1:size(img,1)
%    for j = 1:size(img,2)
%        img(i,j) = img(i,j) + array(i*j);
%    end
%end

end


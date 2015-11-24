function colordisthsv( image )
%COLORDISTHSV Plots the HSV values of img as a cone in HSV space
%   Detailed explanation goes here

% resize and convert image to HSV
image = im2double(imresize(image, 0.2));
imagehsv = rgb2hsv(image);
[height, width, ~] = size(imagehsv);

% get the three channels as vectors
h = reshape(imagehsv(:,:,1), [height*width, 1]);
s = reshape(imagehsv(:,:,2), [height*width, 1]);
v = reshape(imagehsv(:,:,3), [height*width, 1]);

% for each pixel, compute the shift from starting point [0.5, 0.5] by using
% the hue value as the direction (cos(hue) for shift in x direction and
% sin(hue) for shift in y direction) and the saturation as the distance of
% the shift
x = ones(height*width, 1);
for i=1:height*width
    x(i) = x(i)+sin(h(i)*2*pi)*s(i);
end
y = ones(height*width, 1)/2;
for j=1:height*width
    y(j) = y(j)+cos(h(j)*2*pi)*s(i);
end

z = zeros(height*width,1);
z=v;
r = reshape(image(:,:,1), [height*width, 1]);
g = reshape(image(:,:,2), [height*width, 1]);
b = reshape(image(:,:,3), [height*width, 1]);

% creating matrix to color the scatter plot
C = double([r,g,b]);


scatter3(x,y,z,10,C,'filled');
xlabel('Hue/Saturation'), ylabel('Hue/Saturation'), zlabel('Value');

end

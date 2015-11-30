function colordist( image )
%COLORDIST Plots the color pixels in an RGB cube 
%   Displays a colored dot in a rgb cube for each pixel of image 

% figure;

%resize image to reduce amount of pixels
image = im2double(imresize(image, 0.2));
[height, width, ~] = size(image);

%reshape and divide image into three vectors, each containing one color
%channel
x = reshape(image(:,:,1), [height*width, 1]);
y = reshape(image(:,:,2), [height*width, 1]);
z = reshape(image(:,:,3), [height*width, 1]);

%creating matrix to color the scatter plot
C = double([x,y,z]);

%create, label and show scatter plot
scatter3(x,y,z,5,C,'filled');
xlabel('Red'), ylabel('Green'), zlabel('Blue');
end

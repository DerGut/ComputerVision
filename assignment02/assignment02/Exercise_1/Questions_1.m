clear
clc
addpath '../images'

%% a) Test implementation of convolution

patch = [0 0 0
         0 255 0
         0 0 0];
     
boxKernel = [1 1 1;
             1 1 1;
             1 1 1] / 9;

display(convolution(patch, boxKernel));

%% b) Test Implementaion of convolution and primitive kernel application

building = imread('building.jpg');

% generates a gaussian 3x3 filter kernel with a standard deviation of 0.5
kernel = fspecial('gaussian', 25, 5);

figure
subplot(1,3,1);
imshow(building);
title('Building');

subplot(1,3,2);
imshow(primitiveApplyKernel(building, kernel));
title('Gaussian filter');

%% c) Test Implementation of advanced kernel application

subplot(1,3,3);
imshow(applyKernel(building, kernel));
title('Advanced kernel');

 
%% d) Seperable filters

nchoosek(5, 0)
nchoose

%kernel = nchoosek([1 2 1], 3);

vKernel = zeros(3);
hKernel = zeros(3)';
for i = 1:size(vKernel)
    vKernel(i) = nchoosek(size(vKernel)-1,i-1);
    hKernel(i) = nchoosek(size(hKernel)-1,i-1);
end

figure
vKernel = [1;2;1] /4;
hKernel = [1 2 1] /4;

tic();
subplot(1,3,1);
imshow(applyKernel(applyKernel(building, vKernel), hKernel));
title(toc());

vKernel = [1;4;6;4;1];
hKernel = [1 4 6 4 1];
sepKernel = vKernel * hKernel; 
sepKernel = sepKernel /sum(sum(sepKernel));


tic();
subplot(1,3,2);
imshow(applyKernel(building, sepKernel));
title(toc());





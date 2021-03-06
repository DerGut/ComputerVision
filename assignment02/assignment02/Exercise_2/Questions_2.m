clear
clc
addpath '../Exercise_1'
addpath '../images'
car = imread('car.jpg');
%car = rgb2gray(car);

%% a) Simple filter application

% Gradient filter
xGradient = [1 0 -1];
subplot(2,3,1);
imshow(applyKernel(car, xGradient));
title('x gradient left to right');

xGradient = [1;0;-1];
subplot(2,3,4);
imshow(applyKernel(car, xGradient));
title('y gradient top to bottom');

% Prewitt operator
xPrewitt = [1 0 -1;
            1 0 -1;
            1 0 -1] /3;
subplot(2,3,2);
imshow(applyKernel(car, xPrewitt));
title('x Prewitt left to right');

yPrewitt = [1 1 1;
            0 0 0;
            -1 -1 -1] /3;
subplot(2,3,5);
imshow(applyKernel(car, yPrewitt));
title('y Prewitt top to bottom');

% Sobel filter

xSobel = [1 0 -1;
          2 0 -2;
          1 0 -1] /4;
subplot(2,3,3);
imshow(applyKernel(car, xSobel));
title('x Sobel left to right');

ySobel = [1 1 1;
          0 0 0;
          -1 -1 -1];
subplot(2,3,6);
imshow(applyKernel(car, ySobel));
title('y Sobel top to bottom');

%% b)Laplace filter and 'zero crossings'

street = imread('street.png');

laplace = [0 1 0;
           1 -4 1;
           0 1 0] /4;
imshow(applyKernel(street, laplace));

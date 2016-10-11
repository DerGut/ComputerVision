clear
clc
addpath 'images'
img = imread('dolly.png', 'png');

%% a) FT of dolly.png
figure(1)

subplot(1,3,1)
imshow(img);
title('Original')

ft = fft2(img);

subplot(1,3,2)
imshow(ft)
title('Magnitude')

subplot(1,3,3)
imshow(angle(ft))
title('Phase')

%%
figure(2)

ft = fft2(img);
new = log(ft);
imshow(abs(new))

%%
figure(3)

newImg = fft2(ft);
imshow(abs(newImg));

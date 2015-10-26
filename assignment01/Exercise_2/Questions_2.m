clear
img = imread('cameraman.tif');
figure
subplot(1,3,1);
imshow(img);
title('Original');
%% Gaussian noise
%g(x,y,t) = g(x,y) + delta(x, y, t)
%delta(x,y,t) = random number [-variance/2,variance/2]

subplot(1,3,2);
gauss = gauss_noise(img,50);
imshow(gauss);
title('Gauss');

%% Salt-and-pepper noise

subplot(1,3,3);
saltPepper = salt_pepper(img,5);
imshow(saltPepper);
title('Salt-and-pepper');


%% Temporal smoothing
%g(x,y,t+delta(t)) = 
% 1/delta(t) * sum^+delta(t)_t'=t(g(x,y,t')


imgs = uint8(zeros([size(img), 8]));
for i = 1:8
    imgs(:,:,i) = salt_pepper(img,5);
end

figure
subplot(1,4,1);
imshow(imgs(:,:,1));
title('Noisy frame 1');
subplot(1,4,2);
imshow(uint8(mean(imgs(:,:,1:2),3)));
title('Average over 2');
subplot(1,4,3);
imshow(uint8(mean(imgs(:,:,1:4),3)));
title('Average over 4');
subplot(1,4,4);
imshow(uint8(mean(imgs(:,:,1:8),3)));
title('Average over 8)');



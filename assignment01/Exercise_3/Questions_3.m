clear
coins = imread('coins.png');

figure
%% a) invert coins.png
subplot(1,2,1);
imshow(coins);
title('Original');
subplot(1,2,2);
imshow(invert(coins));
title('Inversion');


%% b) plot a histogram
figure
% Matlab intern function
subplot(1,2,1);
histogram(coins);
title('Matlab');

% own function
subplot(1,2,2);     % may apply scaling
histogr(coins);
title('Own');


%% Binarization
figure
subplot(1,2,1);
imshow(binarize(coins, 0.3));
title('Binarized image');


%% Foreground
subplot(1,2,2);
imshow(coins .* uint8(binarize(coins, 0.3)));
title('Foreground seperation');

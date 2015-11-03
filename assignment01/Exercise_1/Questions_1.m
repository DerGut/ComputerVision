clear
clc

%% a) Reads the image and displays it

cameraman = imread('cameraman.tif');
imshow('cameraman.tif');


%% b) Cuts out the head and displays it seperately

figure
% show image with marked region on top of head
subplot(1,2,1);
imshow(markRegion(cameraman, [50 50], [35 95]));
% show head only
subplot(1,2,2);
imshow(extractRegion(cameraman, [50 50], [35 95]));

%% c) Flipping and rotating images in subplots

figure
subplot(2,4,1);
imshow(cameraman);

% 2 - rotating left
subplot(2,4,2);
imshow(rotateLeft(cameraman));

% 3 - rotating 180degrees
subplot(2,4,3);
imshow(rotateUpsideDown(cameraman));

% 4 - rotating right
subplot(2,4,4);
imshow(rotateRight(cameraman));

% 5 - flipping vertically
subplot(2,4,5);
imshow(flipVertically(cameraman));

% 6 - flipping the left rotation
subplot(2,4,6);
imshow(rotateLeftAndFlip(cameraman));

% 7 - flipping horizontally
subplot(2,4,7);
imshow(flipHorizontally(cameraman));

% 8 - flipping the right rotation
subplot(2,4,8);
imshow(rotateRightAndFlip(cameraman));



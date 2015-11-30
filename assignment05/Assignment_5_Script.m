clear
clc
img = imread('peppers.png');

%% Exercise 1 - Color Distribution

% a) Display color distribution in rgb cube
rgb = figure(1);
assignment5_1a(img);
title('rgb');

% b) Display color distribution in hsv cone
hsv = figure(2);
assignment5_1b(img);
title('hsv')

%% Exercise 2 - k-Means Clustering

% Convert image matrix into array

array = img2array(img);

% a) Implementation of k-means
k = 5;

[idx, C] = kmeans(array, k);

% b) Region labelling

out = labelClusters(size(img,1), size(img,2), size(img,3), idx, C);

figure(3)
imshow(out)
title('Labeled clusters')

% c) Evaluation of results for good k

figure(4)

[idx, C] = kmeans(array, 3);
out = labelClusters(size(img,1), size(img,2), size(img,3), idx, C);
subplot(2,2,1);
imshow(out);
title('k = 4');

[idx, C] = kmeans(array, 5);
out = labelClusters(size(img,1), size(img,2), size(img,3), idx, C);
subplot(2,2,2);
imshow(out);
title('k = 6');

[idx, C] = kmeans(array, 7);
out = labelClusters(size(img,1), size(img,2), size(img,3), idx, C);
subplot(2,2,3);
imshow(out);
title('k = 8');

[idx, C] = kmeans(array, 12);
out = labelClusters(size(img,1), size(img,2), size(img,3), idx, C);
subplot(2,2,4);
imshow(out);
title('k = 12');

% After some trials k=6 seemed like a reasonable choice to seperate
% the image into segments. Each pepper can be seen individually. 
% By increasing the k-value, shadows are introduced which do not contribute
% to the overall segmentation. With less k's the peppers start to merge in
% color and cannot be seperated anymore.

% d) HSV



% e) Application of k-means to camera stream
cam = webcamlist;
cameraloop(cam, 5);

% The initialization of the clusters centroids needs to be deterministic
% instead of being random. By calculating initial values from majorities 
% of the image i.e. luminocity or hue, the centroids are pushed into some
% boundaries.
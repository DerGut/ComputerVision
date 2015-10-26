clear

cam = webcam;
preview(cam);

%% Display camera image
img = snapshot(cam);
figure
subplot(1,3,1);
imshow(img);
title('Snapshot');

subplot(1,3,2);
% continuous loop of taking snapshots and displaying them
for i = 1:10
   imshow(snapshot(cam));
end
title('Stream');


%% Motion detection

subplot(1,3,3);
for i = 1:30
    % takes two snapshots
    img = rgb2gray(snapshot(cam));
    img2 = rgb2gray(snapshot(cam));
    % display the difference image
    imshow(difference(img, img2, 0.15));
    title('Difference images');
end


%% Background subtraction

figure
subplot(1,2,1);
background = rgb2gray(snapshot(cam));
imshow(background);
title('Background');

totalBinary = zeros(size(background));
for i = 1:40
    
   % takes a snapshot
   img = rgb2gray(snapshot(cam));
   
   % computes the subtracted foreground
   currentBinary = difference(img, background, 0.15);
   
   % add current foreground to next foreground (binary map)
   totalBinary = totalBinary + currentBinary;
   
   % masks out foreground
   foreground = img .* uint8(totalBinary);
   
   
   subplot(1,2,2);
   imshow(foreground);
   title('Foreground');
end


clear cam
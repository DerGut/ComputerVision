clear
clc
cam = webcam(1);
preview(cam)

%% Excercise 1

%% d) img loop

img = snapshot(cam);
mask_rgb = getMaskForRGB(img);
mask_hsv = getMaskForHSV(img);
mask_opened = openMask(mask_rgb);
mask_largest = largestObject(mask_opened);




%camera loop
fig = figure;
for i=1:50
    loop_img = snapshot(cam);
    l_mask_hsv = getMaskForHSV(loop_img);
    %l_mask_hsv = getMaskForRGB(loop_img);
    l_mask_opened = openMask(l_mask_hsv);
    l_mask_largest = largestObject(l_mask_opened);
    
    boundary_mask =  makeBoundary(l_mask_largest);
    
    show = loop_img + uint8(boundary_mask);
    
    imshow(show);

end
close (fig);


%% Plot a), b), c)
fig2 = figure;
subplot(2,3,1);
imshow(img);
title('Original');
subplot(2,3,2);
imshow(mask_rgb);
title('RGB Mask');
subplot(2,3,3);
imshow(mask_hsv);
title('HSV Mask');
subplot(2,3,4);
imshow(mask_opened);
title('HSV Mask Opened');
subplot(2,3,5);
imshow(mask_largest);
title('Mask of largest object');

close(figure);


%% d) drawing

fig3 = figure;
path = zeros(size(mask_largest,1), size(mask_largest,2),3);
for i=1:50
    loop_img = snapshot(cam);
    l_mask_hsv = getMaskForHSV(loop_img);
    %l_mask_hsv = getMaskForRGB(loop_img);
    l_mask_opened = openMask(l_mask_hsv);
    l_mask_largest = largestObject(l_mask_opened);
    
    path = draw( path, l_mask_largest);
    show = loop_img + uint8(path);
    
    imshow(show);

end
close (fig3);


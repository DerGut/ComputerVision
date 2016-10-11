addpath('images');
img = imread('note.png');

%make binary
imgb = img >100;

%erosion
kernel = [1,1,1;1,1,1;1,1,1];
img_e = kernel_on_img(imgb,kernel,@apply_kernel_erosion);

%dilation 
img_d = kernel_on_img(imgb,kernel,@apply_kernel_dilation);

leaf = imread('leaf.png');
leaf = leaf > 100;
%erosion to implement boundary function
boundary_e = erosion_boundary(leaf);

% distance image
se = strel('disk',1);
e_img = imerode(leaf,se);
dis_img = zeros(size(e_img));
display(size(e_img));
dis_img = dis_img + e_img;
while sum(sum(e_img)) > 0
    e_img = imerode(e_img,se);
    dis_img = uint8(dis_img) + uint8(e_img);
end





subplot(2,3,1);
imshow(img);
subplot(2,3,2);
imshow(img_e);
title('Erosion');
subplot(2,3,3);
imshow(img_d);
title('Dilation');
subplot(2,3,4);
imshow(leaf);
title('Leaf');
subplot(2,3,5);
imshow(boundary_e);
title('Boundary');
subplot(2,3,6);
imshow(dis_img);
title('Distance Image');
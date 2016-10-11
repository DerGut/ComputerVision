function mask = getMaskForHSV(img)

% b) mask for HSV - Color space

img = rgb2hsv(img);

% Thresholds for hsv color space
% h = 0-30 max-30
% s = 60 - 100%
% v = 60 - 100%
img_h = img(:,:,1);
img_s = img(:,:,2);
img_v = img(:,:,3);

h_binary = (img_h < 0.8);
s_binary = img_s > 0.5;
v_binary = img_v > 0.5;
h_binary = h_binary < 1;

mask = h_binary .* s_binary .* v_binary;

end
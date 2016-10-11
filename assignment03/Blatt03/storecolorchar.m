%% define global variables
global IMG1;
global IMG2;
global IMG3;
global CCHAR1;
global CCHAR2;
global CCHAR3;
%% store person 1 
cam = webcam(1);
IMG1 = snapshot(cam);
CCHAR1 = colorchar(rgb2hsv(IMG1));
clear cam;
%% store person 2  
cam = webcam(1);
IMG2 = snapshot(cam);
CCHAR2 = colorchar(rgb2hsv(IMG2));
clear cam;
%% store person 3 
cam = webcam(1);
IMG3 = snapshot(cam);
CCHAR3 = colorchar(rgb2hsv(IMG3));
clear cam;

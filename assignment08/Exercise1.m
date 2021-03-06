%% (a) Implement a function that reads in all templates located in a folder (hint: the templates
% have different sizes, so a Matlab cell array may be useful here).
temps = readtemp('templates');

%% (c) The captcha images exhibit a regular structure. Exploit this structure and adapt the tem-
% plates to better match the target letters of the captchas.
imptemps = improvetemplates(temps);

%% Read images
cap1 = imread('captcha1.jpg');
cap2 = imread('captcha2.jpg');
cap3 = imread('captcha3.jpg');

%% (d) Try to identify the letters displayed on the three captcha images automatically.
rescap1 = identify(cap1, imptemps, 0.6);
figure;
imshow(cap1);
figure;
amount = length(rescap1);
for i=1:amount
    subplot(1,amount,i);
    letternr = rescap1{i,1};
    position = rescap1{i,2};
    imshow(temps{1,letternr});
    titlestr = strcat('Found at x: ',num2str(position(1)),', y: ',num2str(position(2)));
    title(titlestr);
end
%% 
rescap2 = identify(cap2, imptemps, 0.6);
figure;
imshow(cap2);
figure;
amount = length(rescap2);
for i=1:amount
    subplot(1,amount,i);
    letternr = rescap2{i,1};
    position = rescap2{i,2};
    imshow(temps{1,letternr});
    titlestr = strcat('Found at x: ',num2str(position(1)),', y: ',num2str(position(2)));
    title(titlestr);
end
%%
rescap3 = identify(cap3, imptemps, 0.6);
figure;
imshow(cap3);
figure;
amount = length(rescap3);
for i=1:amount
    subplot(1,amount,i);
    letternr = rescap3{i,1};
    position = rescap3{i,2};
    imshow(temps{1,letternr});
    titlestr = strcat('Found at x: ',num2str(position(1)),', y: ',num2str(position(2)));
    title(titlestr);
end

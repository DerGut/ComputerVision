% (a) Transform the image dolly.png into the frequency space (you may 
% use the Matlab function fft2). The result will be a complex matrix. 
% Plot histograms for the amplitude and phase values.

addpath 'images'
dolly = imread('dolly.png');
ftdolly = fft2(dolly);
amplitude = abs(ftdolly);
phase = angle(ftdolly);

subplot(3,1,1);
imshow(dolly);
title('Original');
subplot(3,1,2);
hist(amplitude(:));
title('Amplitude values');
subplot(3,1,3);
hist(phase(:));
title('Angle values');

%% (b) Display the amplitude and phase in separate images.
subplot(2,1,1);
imshow(log(abs(fftshift(ftdolly))),[]);
title('Amplitude (log) (shifted)');
subplot(2,1,2);
imshow(phase,[]);
title('Phase');

%% (c) Transform the image back from the frequency space to the image space 
% (again using fft2). What do you observe? Explain and repair the result.
dolly2 = (fft2(ftdolly));
subplot(2,1,1)
imshow(dolly2,[]);
title('After applying FT again to the result');
dolly3 = fft2(conj(ftdolly)); %repaired
subplot(2,1,2);
imshow(dolly3,[]);
title('After complex conjugating the result and applying FT again');
%% (d) Now restore the image, but only keep the amplitude and vary the 
% phase. Try fixed phase values (0, pi/2,. . . ), a random phase matrix, 
% or a noisy version of the original phase values.
sz = size(dolly);

% Different phase matrices
phase1 = zeros(sz);
phase2 = ones(sz)*pi/2;
phase3 = ones(sz)*pi;
phase4 = normrnd(0,1,sz);
phase5 = imnoise(phase, 'gaussian');

% Frequency space images created by original amplitude combined with 
% different phases
ft1 = amplitude .* (cos(phase1) + 1i*sin(phase1));
ft2 = amplitude .* (cos(phase2) + 1i*sin(phase2));
ft3 = amplitude .* (cos(phase3) + 1i*sin(phase3));
ft4 = amplitude .* (cos(phase4) + 1i*sin(phase4));
ft5 = amplitude .* (cos(phase5) + 1i*sin(phase5));

% Restored images with different phases
resft1 = ifft2(ft1);
resft2 = ifft2(ft2);
resft3 = ifft2(ft3);
resft4 = ifft2(ft4);
resft5 = ifft2(ft5);

% Display
subplot(2,3,1);
imshow(dolly);
title('Original');
subplot(2,3,2);
imshow(resft1,[]);
title('with Phase 0');
subplot(2,3,3);
imshow(resft2,[]);
title('with Phase pi/2');
subplot(2,3,4);
imshow(resft3,[]);
title('with Phase pi');
subplot(2,3,5);
imshow(resft4,[]);
title('with random Phase');
subplot(2,3,6);
imshow(resft5,[]);
title('with noisy original Phase');

%% (e)

% Different amplitude matrices
amplitude1 = zeros(sz);
amplitude2 = ones(sz)*pi/2;
amplitude3 = ones(sz)*pi;
amplitude4 = rand(sz)*1000;
amplitude5 = imnoise(amplitude, 'gaussian');

% Frequency space images created by original amplitude combined with 
% different phases
ft1 = amplitude1 .* (cos(phase) + 1i*sin(phase));
ft2 = amplitude2 .* (cos(phase) + 1i*sin(phase));
ft3 = amplitude3 .* (cos(phase) + 1i*sin(phase));
ft4 = amplitude4 .* (cos(phase) + 1i*sin(phase));
ft5 = amplitude5 .* (cos(phase) + 1i*sin(phase));

% Restored images with different phases
resft1 = ifft2(ft1);
resft2 = ifft2(ft2);
resft3 = ifft2(ft3);
resft4 = ifft2(ft4);
resft5 = ifft2(ft5);

% Display
subplot(2,3,1);
imshow(dolly);
title('Original');
subplot(2,3,2);
imshow(resft1,[]);
title('with Amplitude 0');
subplot(2,3,3);
imshow(resft2,[]);
title('with Amplitude pi/2');
subplot(2,3,4);
imshow(resft3,[]);
title('with Amplitude pi');
subplot(2,3,5);
imshow(resft4,[]);
title('with random Amplitude');
subplot(2,3,6);
imshow(resft5,[]);
title('with noisy original Amplitude');

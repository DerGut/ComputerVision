%%(a) Read the image text deg.jpg, display it and apply Fourier transform.
% The resulting amplitude should show the angle of the text.

text = imread('text_deg.jpg');
imshow(text);
fttext = fft2(text);
amplitude = abs(fttext);
figure;
imshow(log(abs(fftshift(fttext))),[]);

%% (b) Try to automatically get the rotation angle from the Fourier space.

str = strel('square',3);
ertext = double(imerode(text,str)); % apply erosion
ftertext = fft2(ertext); % fourier transform eroded version 
amplitude = abs(fftshift(ftertext));
imshow(log(amplitude),[]);
amplitude(amplitude < 100000) = 0; % threshhold amplitude values
imshow(log(amplitude));
[maximum index] = max(amplitude(:)); % find maximum
ycoord = uint8(index/600); % compute position in original matrix
xcoord = mod(index,600);
ang = angle(ftertext(ycoord,xcoord)); % use value from original FT matrix at the position and compute the angle

%% (c) Rotate the image back to its originally intended orientation (imrotate).

rottext = imrotate(text, -(ang*180/pi)); % convert radians to degree and rotate
imshow(rottext);

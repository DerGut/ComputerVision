
I = imread('lighthouse.png');
I = double(rgb2gray(I));

%% a) - Calculate the scale space
scale_space = scale_space(I);

% Display stuff ...
figure('name', 'Scale space');
for idx = 1:20
    row = ceil(idx/5);
    col = mod(idx-1,5) + 1;
	subplot(4,5,idx);
    imshow(scale_space{1,row}(:,:,col),[]);
end


%% b) - Calculate DoG
DoG = difference_of_Gaussian(scale_space);

% Display stuff ...
figure('name', 'Scale space vs. Difference of Gaussian');
for idx = 1:20
    row = ceil(idx/5);
    col = mod(idx-1,5) + 1;
	subplot(4,5,idx);
	if col == 1
        imshow(scale_space{1,row}(:,:,1),[]);
    else
        imshow(DoG{1,row}(:,:,col-1),[]);
	end
end


%% c) - Detect extrema

key_points = detect_extrema(DoG);


%% d) - Remove keypoints that lie on edges

key_points = eliminate_edge_responses(key_points, DoG, 10);


%% e) - Filter magnitude with threshold

key_points = filter_magnitude(key_points, DoG, 15);

% Display stuff ...
figure('name', 'Reduced Keypoints');
for idx = 1:20
    row = ceil(idx/5);
    col = mod(idx-1,5) + 1;
	subplot(4,5,idx);
	if col == 1
        imshow(scale_space{1,row}(:,:,1),[]);
    else
        imshow(key_points{1,row}(:,:,col-1));
	end
end

%% f) - Display keypoints on image

img_with_PIs = mark_key_points(key_points, I);

figure('name', 'Initial image with points of interest marked');
imshow(img_with_PIs, []);

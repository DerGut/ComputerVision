
addpath 'trainimg'
addpath 'testimg'

% Exercise 2 - (eigenfaces)

listings = dir('trainimg/*.pgm');
trainimgs = cell(1,size(listings,1));
for i = 1:size(listings,1)
    trainimgs{1,i} = imread(listings(i).name);
end


%% a) - Principal Component Analysis

imgsz = size(trainimgs{1,1},1)*size(trainimgs{1,1},2);
input = zeros(size(trainimgs,2), imgsz);
for i = 1:size(input,1)
   input(i,:) = reshape(trainimgs{1, i}(:,:), [1 imgsz]);
end

pca = pca(input, 'Centered', false);


%% b) - Display the eigenfaces

img_height = size(trainimgs{1,1},1);
img_width = size(trainimgs{1,1},2);
eigenfaces = reshape(pca, [img_height img_width size(pca,2)]);

amount = size(eigenfaces,3);
plot_height = floor(sqrt(amount));
plot_width = ceil(amount/plot_height);
for i = 1:amount
   subplot(plot_height, plot_width, i);
   imshow(eigenfaces(:,:,i),[]);
end


%% c) - Project images into eigenspace to calculate feature vectors

average_face = mean(input);

C = (input*input');

[features, ~] = eig(C);
P = C * pca';
imshow(reshape(P(1,:),[192 168]),[]);

difference_faces = zeros(size(input));
for i = 1:size(pca,2)
    difference_faces(i,:) = input(i,:) - average_face;
end



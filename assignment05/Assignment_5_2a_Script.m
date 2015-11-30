clear;

parrot = imread('peppers', 'png');
parrot = imresize(parrot, 0.2);
sizeParrot = size(parrot);

data = parrot(1,:,:);
for i=2:sizeParrot(1)
    data = [data parrot(i,:,:)];
end

%squeeze to remove first dimension
data = squeeze(data);
%invert to get required dimensions
data = data';

data = double(data);
%%
% test k-means
labeledData = ourKmeans(data,5,250);

labels = zeros(sizeParrot(2), sizeParrot(1));

for i=1:length(data(1,:))
    labels(i) = labeledData(1,i);
end

labels = labels';


rgb = label2rgb(labels);

%%
subplot(1,2,1);
imshow(parrot);
subplot(1,2,2);
imshow(rgb);

clear
clc
addpath images
addpath Exercise_1
addpath Exercise_2
seg = imread('segments.png');

%% 1.a) Apply label_regions

% Converts image into binary with threshold ?? 0.7 ??
% seg = im2bw(seg, 0.7);
% labels = label_regions(seg);
% imshow(label2rgb(labels,'jet'))

%% 2. Apply Relaxation Labeling

% a) Initializing Probabilities

[labels, num] = bwlabel(im2bw(seg,graythresh(seg)));
% %imshow(label2rgb(labels));
% p = zeros(2,num);
% % Foreground probability for '1'
% p(1,:) = 0.7;
% % Foreground probability for '0'
% p(2,:) = 0.2;


binary = im2bw(seg,graythresh(seg));
p = zeros(2,2);
% Foreground probability for '1'
p(1,:) = 0.8;
% Foreground probability for '0'
p(2,:) = 0.2;
probs = initialize_probabilities(binary, p);
% probs = initialize_probabilities(labels, p);

relax = RelaxLabel2D(probs, );
imshow(relax)
%%
% new_probs = update_probabilities(probs);
% figure
% [labels, conf] = labels_for_probabilities(probs);
% subplot(3,3,1);
% imshow(probs(:,:,2));
% title('probs1')
% 
% subplot(3,3,4);
% imshow(labels);
% title('initial labels');
% subplot(3,3,7);
% imshow(conf);
% title('initial conf');
% for i = 1:10
%     new_probs = update_probabilities(new_probs);
%     if i == 5
%         [labels, conf] = labels_for_probabilities(new_probs);
%         subplot(3,3,2);
%         imshow(new_probs(:,:,2));
%         
%         subplot(3,3,5);
%         imshow(labels);
%         title('2steps labels');
%         subplot(3,3,8);
%         imshow(conf);
%         title('2steps conf');
%     end
% end
% 
% [labels, conf] = labels_for_probabilities(new_probs);
% subplot(3,3,3);
% imshow(new_probs(:,:,2));
% title('probs1');
% 
% subplot(3,3,6);
% imshow(labels);
% title('3steps labels');
% subplot(3,3,9);
% imshow(conf);
% title('3steps conf');


% b)


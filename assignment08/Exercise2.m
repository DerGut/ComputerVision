addpath images
addpath waldo

%% Where's Wally?

% Read in the templates (bw)
temps = readtemp('waldo');

imptemps = improvetemplates(temps);

img = imread('wheresWaldo1.jpg');
        
% where1 = img(size(img,1)/4:size(img,1)/2, ...
%             size(img,2)/2:size(img,2),:);

% where1 = img(680:820,1420:1520,:);

% Calculate maxSize of templates
maxSize = [0 0];
for i = 1:length(imptemps)
   if ( size(imptemps{1,i},1) * size(imptemps{1,i},2) ) ...
           > ( maxSize(1) * maxSize(2) )
       maxSize = [size(imptemps{1,i},1) size(imptemps{1,i},2)];
   end
end


patches = getRedPatches(img, maxSize);

for i = 1:size(patches,3)
    id_waldo = identify(patches(:,:,i), imptemps, 1);
    
    amount = length(id_waldo);
    for i=1:amount
        subplot(1,amount,i);
        profile_nr = id_waldo{i,1};
        position = id_waldo{i,2};
        imshow(temps{1,profile_nr});
        titlestr = strcat('Found at x: ', position(1),', y: ',num2str(position(2)));
        title(titlestr);
    end
end



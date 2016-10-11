function [ patches ] = getRedPatches( img, maxTempSize )
%GET_PATCHES Extracts patches of a certain size that contain red.

if mod(maxTempSize(1), 2) ~= 0
    maxTempSize(1) = maxTempSize(1) + 1;
end
if mod(maxTempSize(2), 2) ~= 0
    maxTempSize(2) = maxTempSize(2) + 1;
end
    
% Allocate matrices for output
maxAmountPatches = int8(abs(size(img,1)/maxTempSize(1) * size(img,2)/maxTempSize(2)));
patches = zeros(maxTempSize(1),maxTempSize(2), maxAmountPatches);
patch_coords = zeros(2, size(patches,3));

% Create padding around image
padding = zeros(size(img,1) + maxTempSize(1),size(img,2) ... 
            + maxTempSize(2), size(img,3));
padding(maxTempSize(1)/2:size(padding,1)-maxTempSize(1)/2-1, ...
    maxTempSize(2)/2:size(padding,2)-maxTempSize(2)/2-1, :) = img;

patch_count = 1;
% Iterate through image
for r = 1:size(img,1)
    for c = 1:size(img,2)

        % Check for red values
        if img(r,c,1) > 230
            patches(:,:,patch_count) = ...
                padding((r+maxTempSize(1)/2-1):(r+maxTempSize(1)/2-1+maxTempSize(1)), ...
                (c+maxTempSize(2)/2-1):(c+maxTempSize(2)/2-1+maxTempSize(2)));
            patch_coords(1,patch_count) = r - maxTempSize(1);
            patch_coords(2,patch_count) = c - maxTempSize(2);
            patch_count = patch_count + 1;
        end
        
    end
end

% Adapt size of array
for i = 0:size(patches,3)
   if sum(any(patches(:,:,i))) == 0
       patches(:,:,i) = [];
       patch_coords(:,i) = [];
   end
end

end


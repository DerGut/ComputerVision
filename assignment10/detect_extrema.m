function [ key_points ] = detect_extrema( DoG )
%DETECT_EXTREMA Checks 26-neighbourhood of pixel to detect local extrema.

key_points = {1,size(DoG,2)};
image_size = [size(DoG{1,1},1) size(DoG{1,1},2)];
% [dx, dy, dz] = ind2sub([3 3 3], -13:13);
dx = [-1 -1 -1 -1 -1 -1 -1 -1 -1 ...
        0 0 0 0 0 0 0 0 0 ...
        1 1 1 1 1 1 1 1 1];
dy = [-1 -1 -1 0 0 0 1 1 1 ...
        -1 -1 -1 0 0 0 1 1 1 ...
        -1 -1 -1 0 0 0 1 1 1];
dz = [-1 0 1 -1 0 1 -1 0 1 ...
        -1 0 1 -1 0 1 -1 0 1 ...
        -1 0 1 -1 0 1 -1 0 1];
for octave = 1:size(DoG, 2)
    
    mask_array = true(image_size(1), image_size(2), 4);
    mask_array([1 end],:,:) = false;
    mask_array(:,[1 end],:) = false;
    mask_array(:,:,[1 end])  = false;
    for scale = 2:size(DoG{1,1},3)-1

        for pixel = 1:image_size(1) * image_size(2)
            row = ceil(pixel/image_size(2));
            col = mod(pixel-1,image_size(2)) + 1;
            max = true;
            min = true;
            for idx = 1:27
                if dx(idx) == 0 && dy(idx) == 0 && dz(idx) == 0
                    continue;
                end
                if row == 1 || row == image_size(1) ...
                        || col == 1 || col == image_size(2)
                    continue;
                end
                value = DoG{1,octave}(row,col,scale);
                neighbour = DoG{1,octave}(row+dx(idx),col+dy(idx),scale+dz(idx));
                if  value <= neighbour
                    max = false;
                end
                if value >= neighbour
                    min = false;
                end
                if ~(max || min)
                    mask_array(row,col,scale) = false;
                    continue;
                end
           end
       end
        
    end
    image_size = ceil(image_size / 2);
    key_points{1,octave} = mask_array;

end

end


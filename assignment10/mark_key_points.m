function [ I ] = mark_key_points( key_points, I )
%MARK_KEY_POINTS Locates the keypoints on an image and marks them.


for octave = 1:size(key_points,2)
    for scale = 1:size(key_points{1,octave},3)
        points = imresize(key_points{1,octave}(:,:,scale), size(I));
        points = bwmorph(points, 'remove');
        [row, col] = find(points);
        for i = 1:size(row)
            I(row(i), col(i)) = 255;
        end
    end
    
end


end


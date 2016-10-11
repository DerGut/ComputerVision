function [ DoG ] = difference_of_Gaussian( scale_space )
%DIFFERENCE_OF_GAUSSIAN Calculates the approximation of the
%scale-normalized Laplacian of a Gaussian.

DoG = {1,size(scale_space,2)}
image_size = [size(scale_space{1,1},1) size(scale_space{1,1},2)];
for octave = 1:size(scale_space,2)
    
    D = zeros(image_size(1), image_size(2), 4);
    for i = 2:5
        D(:,:,i-1) = scale_space{1,octave}(:,:,i) ...
            - scale_space{1,octave}(:,:,i-1);
    end
    image_size = ceil(image_size / 2);
    DoG{1,octave} = D;
end


end


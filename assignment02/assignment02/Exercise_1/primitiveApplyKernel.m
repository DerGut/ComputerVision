function [ out ] = primitiveApplyKernel( img, kernel )
%PRIMITIVE_APPLY_KERNEL Loops with the indicated kernel over the whole 
%image and applies the convolution.

% computes the distance from the kernel center to its boarder
rOffset = (size(kernel,1)-1) /2;
cOffset = (size(kernel,2)-1) /2;

out = uint8(zeros(size(img,1), size(img,2)));

% loop through inner part of image (except boundary determined by kernel
% offset)
for i = 1+rOffset:size(img,1)-rOffset
    for j = 1+cOffset:size(img,2)-cOffset
           
            % apply convolution(patch, kernel) to each pixel of out
            out(i,j) = convolution(...
                img(i-rOffset:i+rOffset,j-cOffset:j+cOffset), kernel);    
        
    end
end


end


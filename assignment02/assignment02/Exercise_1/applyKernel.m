function [ out ] = applyKernel( img, kernel )
%APPY_KERNEL Loops with the indicated kernel over the whole 
%image and applies the convolution.

% computes the distance from the kernel center to its boarder
rOffset = (size(kernel,1)-1) /2;
cOffset = (size(kernel,2)-1) /2;

out = uint8(zeros(size(img,1), size(img,2)));
boardered = boarderPrep(img, rOffset, cOffset);

% loop through inner part of image (except boundary determined by kernel
% offset)
for i = 1:size(img,1)
    for j = 1:size(img,2)
           
            % apply convolution(patch, kernel) to each pixel of out
            out(i,j) = convolution(...
                boardered(i:i+rOffset*2,j:j+cOffset*2), kernel);    
        
    end
end

end


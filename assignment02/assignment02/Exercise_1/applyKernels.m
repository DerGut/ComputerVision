function [ out ] = applyKernels( img, vKernel, hKernel )
%APPLY_KERNELS Loops with the indicated kernel over the whole 
%image and applies the convolution.


out = uint8(zeros(size(img,1), size(img,2)));
boardered = boarderPrep(img, [size(vKernel), size(hKernel)]);

% loop through inner part of image (except boundary determined by kernel
% offset)
for i = 1:size(img,1)
    for j = 1:size(img,2)
           
            % apply convolution(patch, kernel) to each pixel of out
            out(i,j) = convolution(...
                boardered(i:i+rOffset*2,j:j+cOffset*2), vkernel);
            out(i,j) = convolution(...
                boardered(
        
    end
end

end


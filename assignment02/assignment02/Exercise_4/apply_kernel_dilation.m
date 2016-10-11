function result = apply_kernel_dilation(kernel, patch)
    equals = patch == kernel;
    equals2 = sum(sum(equals));
%     display(equals);
    if equals2 > 0
        result = 1;
    else
        result = 0; 
    end
    
end
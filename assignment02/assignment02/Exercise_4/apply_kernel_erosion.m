function result = apply_kernel_erosion(kernel, patch)
    equals = patch ~= kernel;
    equals2 = sum(sum(equals));
%     display(equals);
    if equals2 > 0
        result = 0;
    else
        result = 1;
    end
    
end
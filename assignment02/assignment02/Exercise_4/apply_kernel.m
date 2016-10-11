function result = apply_kernel(kernel, patch) 
    
    tmp = kernel .* patch;
    result = sum(sum(tmp));
    
end
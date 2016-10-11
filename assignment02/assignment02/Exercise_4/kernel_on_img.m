function result = kernel_on_img(img, kernel, apply_kernel) 
  
    s = size(img);
    ks = size(kernel);
    ks = ks(1);
    kp = (ks-1)/2;
    %padd with zeros
    img_p = zeros(size(img)+ks);
    sp = size(img_p);
    a = kp+1;
    img_p(a:end - a , a : end - a) = img;
    i=0;
    j=0;
    for i = a:sp(1)-kp
        for j = a:sp(2)-kp
            i1 = i-kp;
            i2 = i+kp;
            j1 = j-kp;
            j2 = j+kp;
            patch = img_p(i1:i2,j1:j2);
            result(i,j) = apply_kernel(kernel, patch);
        end
        
    end
    result;

end

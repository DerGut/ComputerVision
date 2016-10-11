function result = kernel_on_img_ext(img, kernel, kernel_apply) 

    s = size(img);
    ks = size(kernel);
    ks = ks(1);
    kp = (ks-1)/2;
    
    for i = 1:s(1)
        for j = 1:s(2)
            used_kernel = kernel;
            if i <= kp
                %oben passt der kernel nicht rein
                %einen row vector fuer den kernel bekommen
               used_kernel = used_kernel(kp-(kp-i-1):end,:);
               x1 = 1;
               x2 = i+kp;
               
            
            elseif i > s(1)-kp
                %unten passt der kernel nicht rein
               used_kernel = used_kernel(1:end-kp+(s(1)-i),:);
               x1 = i-kp;
               x2 = s(1);
            else 
                x1 = i-kp;
                x2 = i+kp;
            end
            
            
            if j <= kp
                %oben passt der kernel nicht rein
                %einen row vector fuer den kernel bekommen
                used_kernel = used_kernel(:,kp-(kp-j-1):end);
               y1 = 1;
               y2 = j+kp;
            
            elseif j > s(2)-kp
                %unten passt der kernel nicht rein
               used_kernel = used_kernel(:,1:end-kp+(s(2)-j));
               y1 = j-kp;
               y2 = s(1);
            else 
                y1 = j-kp;
                y2 = j+kp;
            end
            patch = img(x1:x2,y1:y2);
            img(i,j) = kernel_apply(used_kernel, patch);
        end
        
    end
    result = img;

end

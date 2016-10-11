function mask = getMaskForRGB(img) 
    % a) mask for the object in RGB Color space
    img_red = img(:,:,1);
    img_green = img(:,:,2);
    img_blue = img(:,:,3);

    binary_red = img_red > 150;

    binary_blue = img_blue < 110;
    binary_green = img_green < 110;

    mask = binary_red .* binary_green .* binary_blue;

    mask = repmat(mask,[1,1,3]);



end
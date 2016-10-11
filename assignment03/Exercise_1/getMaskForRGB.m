function mask = getMaskForRGB(img) 
    % a) mask for the object in RGB Color space

ratio = 0.7;
redMask = ratio*img(:,:,2)+ratio*img(:,:,3) < img(:,:,1);
greenMask = ratio*img(:,:,1)+ratio*img(:,:,3) < img(:,:,2);
blueMask = ratio*img(:,:,1)+ratio*img(:,:,2) < img(:,:,3);

cyanMask = 5*ratio*img(:,:,1) < img(:,:,2)+img(:,:,3);
magentaMask = 5*ratio*img(:,:,2) < img(:,:,1)+img(:,:,3);
yellowMask = 5*ratio*img(:,:,3) < img(:,:,1)+img(:,:,2);
mask = redMask | greenMask | blueMask ...
        | cyanMask | magentaMask | yellowMask;



end
function [ extraction ] = extractRegion( img , size, location )
%EXTRACT_REGION Extracts a previously defined region from the source image


% masking out the region to be extracted
extraction = img(location(1):location(1)+size(1)-1,...
    location(2):location(2)+size(2)-1);


end


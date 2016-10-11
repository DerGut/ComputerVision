function result = erosion_boundary(img)
    
    se = strel('disk',2);        
    erodedBW = imerode(img,se);

    result = erodedBW ~= img;


end
function boundary_mask = makeBoundary(mask)

    [r,c] = find(mask==1);
    rc = [r,c];
    
    max_y = max(rc(:,1));
    min_y = min(rc(:,1));
    max_x = max(rc(:,2));
    min_x = min(rc(:,2));
    
    mask = zeros(size(mask));
    
    % obere Kante rechteck
    mask(max_y, min_x:max_x) = 255;
    % untere    Kante rechteck
    mask(min_y, min_x:max_x) = 255;
    %linke kante rechteck
    mask(min_y:max_y, min_x) = 255;
    %rechte kante rechteck
    mask(min_y:max_y, max_x) = 255;
    
    boundary_mask = cat(3,mask,mask,mask);

end
function mask_opened = openMask(mask)
    % c) imopen to remove irregularaties
    se = strel('disk',5);
    mask_opened = imopen(mask,se);

end
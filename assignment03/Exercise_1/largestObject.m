function largest = largestObject(mask)

    %label the mask
    [labels, numLabels] = bwlabel(mask);

    %only keep the largest
    largest = 0;
    largest_label = 0;

    for i = 1:numLabels
        summe = sum(labels(:) == i);
        if summe > largest 
           largest = summe;
           largest_label = i;
        end
    end

    %Now only keep largest
    if largest == 0
        largest = labels == 1;
    else
        % nur das largest label uebernehmen
        largest = labels == largest_label;
    end
    
end

function [labels , count] = label_regions(bw_img) 
%LABEL_REGIONS Perform region labeling.
% LABEL_REGIONS(BW_IMG) Label the regions in the binary
% (black and white) image BW_IMG. The function returns
% an indexed image LABELS of the same size, containing
% the region labels. COUNT holds the number of regions
% discovered.

padding = boolean(zeros(size(bw_img,1)+2,size(bw_img,2)+2));
padding(2:end-1,2:end-1) = bw_img;

labels = zeros(size(bw_img,1),size(bw_img,2));
count = 0;
countStays = false;

% Iterates through the source image
for row = 2:size(bw_img,1)-1
    for col = 2:size(bw_img,2)-1
        
        if padding(row,col) == 1
            if countStays
                count = count + 1;
            end
            label = 0;

            countStays = false;
            % Iterates through neighboring pixels
            for y = 0:1
                for x = 0:1
                
                    % If not same pixel
                    if y ~= 0 && x ~= 0
                        % If value is 1 (region) and neighboring pixel too (same
                        % region)
                   
                        if padding(row,col) == 1 && padding(row+y,col+x) == 1
                            % If new label has to be assigned
                            if labels(row+y,col+x) == 0
                                label = count + 1;
                            end
                            % If a label is already assigned                     
                            if labels(row+y,col+x) > 0
                                label = labels(row+y,col+x);
                                countStays = true;
                            end                
                        end                   
                    end
                
                end
            end
            labels(row,col) = label;
        end
    end
end


end
function [ out ] = labelClusters( imgHeight, imgWidth, imgColors, idx, C )
%LABEL_CLUSTERS Takes indices and centroids from the k-means algorithm as
%an input and assigns those values corresponding to their position in the
%array to an image.


% Convert Array of indices into image matrix
labels = zeros(imgHeight, imgWidth);
for row = 1:imgHeight
    labels(row,:) = idx( imgWidth*row - imgWidth+1:imgWidth*row );
end

% Assign centroid values to labels
out = zeros(imgHeight, imgWidth, imgColors);
for label = 1:size(C,1)
    mask = labels == label;
    for color = 1:imgColors
        channel = out(:,:,color);
        channel(mask) = C(label,color);
        out(:,:,color) = channel;
    end
end

out = uint8(out);

end


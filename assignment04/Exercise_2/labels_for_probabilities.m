function [labels , conf] = labels_for_probabilities(probs) 
%LABELS_FOR_PROBABILITIES Initialize relaxation labeling.
% [LABELS , CONF] = LABELS_FOR_PROBABILITIES(PROBS)
% Get the LABELS from a probability matrix PROBS. Also
% compute a confidence map CONF for these labels.


conf = abs(diff(probs,size(probs,3)-1,3));
labels = zeros(size(conf));
for label = 2:size(probs,3) 
    labels = labels + im2bw(probs(:,:,label),graythresh(probs(:,:,label)));
end
labels = im2bw(labels,graythresh(labels));


end

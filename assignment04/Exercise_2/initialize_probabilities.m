function probs = initialize_probabilities(labels ,p) 
%INITIALIZE_PROBABILITIES Initialize relaxation labeling.
% PROBS = INITIALIZE_PROBABILITIES(LABELS ,P) Initialize the
% probability values for relaxation labeling. LABELS is an
% indexed image holding region labels. P is the probability
% that should initially be assigned to the given labels.
% PROBS is a three dimension array of size
% SIZE(LABELS) x NUMBER_OF_LABELS , holding the initial
% probabilities for every label.


% Allocates memory for SIZE(LABELS) x NUMER_OF_LABELS matrix
probs = zeros(size(labels,1),size(labels,2),size(p,2));

% Iterates through labels
parfor label = 1:size(p,2)    
    % ForegroundMask for label_N
    mask = labels == label-1;
    probs(:,:,label) = probs(:,:,label) + mask .* p(1,label);
    % Assign background probability to all of the matrix
    probs(:,:,label) = probs(:,:,label) + (mask == 0) .* p(2,label);
end

end
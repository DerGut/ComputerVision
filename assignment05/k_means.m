function [ clusterIdx ] = k_means( observations, k )
%K_MEANS Calculates k clusters of the set of observations


% Initialize cluster centers
centroids = rand(size(observations,1),k) .* max(max(observations));

% masks the data samples to the corresponding cluster centroids (1 =
% assigned; 0 = unassigned)
clusterMask = zeros(size(observations,2),k);

% Assign points to clusters depending on proximity to the centers
% E(D,{w_j}) = 1/N_D sum_ND( abs(c_i - w_m(c_i) ) )

% sets errors to max_value and initializes update conditions
epsilon = 1;
minErrors = ones(size(observations,2),1) .* realmax('single');
newMinErrors = ones(size(observations,2),1) .* realmax('single') - epsilon;
while sum(minErrors - newMinErrors) / size(observations,2) >= epsilon
    
    % update while condition to new errors
    minErrors = newMinErrors;
    % iterates through the data samples
    for observation = 1:size(observations,2)
    
        % iterates through k centroids
        for centroid = 1:k
            % error per centroid
            error = 0;
            for dim = 1:size(observations,1)
                % difference between each data value and the centroid
                error = error + abs(observations(dim,observation) ...
                    - centroids(dim,k));
            end
            % adapts the error to data dimension
            error = error / size(obsevations,1);
            % if new minimum has been found
            if error < newMinErrors(observation)
                % set as new minimum
                newMinErrors(observation) = error;
                % erase old minimum from cluster mask
                clusterMask(observations,:) = 0;
                % add new minimum
                clusterMask(observations,k) = 1;
            end
        end % centroids
    
    end % observations
    
    
end % while > epsilon


% read cluster mask and prepare output
clusterIdx = zeros(size(observations,2),1);
for observationIdx = 1:size(observations,1)
    clusterIdx(observationIdx) = find(clusterMask(observationIdx,:));
end
    
end


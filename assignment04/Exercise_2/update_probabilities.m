function new_probs = update_probabilities(probs) 
%UPDATE_PROBABILITIES Initialize relaxation labeling.
% [NEW_PROBS CHANGE] = UPDATE_PROBABILITIES(PROBS)
% Update the probability values using the formulae from the
% lecture. NEW_PROBS are the updated label probabilities. 


new_probs = zeros(size(probs));

% Iterate through pixels
for row = 1:size(probs,1)
    for col = 1:size(probs,2)
            
        % Iterate through neighbours
        Q_row_col = zeros(1,1,size(probs,3));
        for y = -1:1
            for x = -1:1
                if y ~= 0 && x ~= 0 ...
                        && row + y > 0 && row + y <= size(probs,1) ...
                        && col + x > 0 && col + x <= size(probs,2)
                    % Determine matching probabilities for pixels of all
                    % labels and add up to allNeighbourhood count
                    Q_row_col = Q_row_col ...
                        + (probs(row,col,:) == probs(row+y,col+x,:) );
                end
            end
        end
        Q_row_col = Q_row_col ./ 8;
        for label=1:size(probs,3)
            new_probs(row,col,label) = ...
                (probs(row,col,label) * (1 + Q_row_col(label)) ) ;
        end
        
    end
end
    


end


function [ average ] = temporalSmoothing( imgs )
%TEMPORAL_SMOOTHING Takes a sequence of noisy images
% and averages them.
%g(x,y,t+delta(t)) = 
% 1/delta(t) * sum^+delta(t)_t'=t(g(x,y,t')

average = mean(imgs,3);

end


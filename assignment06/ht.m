function [ H, theta, rho ] = ht( BW )
%HT Implementation of the hough transform

% Define accumulator space A
% x-axis: angle [0,pi]
% y-axis: distance to origin
A = zeros(sqrt(size(BW,1)^2+size(BW,2)^2), lnspace(0, pi));


% Compute curve in hough space for each white pixel

end


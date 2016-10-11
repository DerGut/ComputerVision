function [ ft ] = ft( measurements )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


N_measurements = size(measurements,1);
ft = zeros(N_measurements);
frequencies = 1:100;

for frequency = frequencies
   average_point = 0. +  1 * 1j * 0.; 
   n = 0.0;
   for meas = measurements
      fractional_distance = n / N_measurements;
      average_point = average_point + ...
          meas * exp(-1j * 2 * pi * frequency * fractional_distance);
      average_point = average_point / N_measurements;
      ft(n+1) = average_point;
      n = n + 1;
   end
end


end


function [ key_points ] = filter_magnitude( key_points, DoG, threshold )
%FILTER_MAGNITUDE Filters points of interest given a certain threshold.


for octave = 1:size(DoG,2)
    mask = abs(DoG{1,octave}) > threshold;
    key_points{1,octave} = key_points{1,octave} .* mask;
end


end


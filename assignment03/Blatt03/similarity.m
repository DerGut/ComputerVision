function [ simvalue ] = similarity( hist1, hist2 )
%SIMILARITY Returns a value that indicates similarity of hist1 and hist2
%   The lower the value, the more similar the two images are.

length = size(hist1,2);
simvalue = 0;
for i=1:length
    simvalue = simvalue + abs(hist1(i)-hist2(i));
end
end


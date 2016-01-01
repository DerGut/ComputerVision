 function [ improvedcell ] = improvetemplates( tempcell )
%IMPROVETEMPLATES Improves the templates in the cell array tempcell
%   improvedcell is a cell array containing the improved templates from the
%   cell array tempcell. They are improved by lowering the background value
%   of the templates to a gray value more close to the level of the image
%   background(noise)

amount = length(tempcell);
improvedcell = cell(1,amount);

for i=1:amount
    temp = tempcell{1,i};
    temp(temp==255) = 225;
    improvedcell{1,i} = temp;
end

end

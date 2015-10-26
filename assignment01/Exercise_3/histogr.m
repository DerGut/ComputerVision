function [  ] = histogr( img )
%HISTOGR Displays a histogram of an image

values = zeros(1,255);
for i = 1:size(img,1)
    for j = 1:size(img,2)
        values(img(i,j)) = values(img(i,j)) + 1;
    end
end

bar(values, 10);


end


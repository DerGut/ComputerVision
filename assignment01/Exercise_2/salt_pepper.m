function [ noisy ] = salt_pepper( img, percentage )
%SALT_PEPPER Generates a noisy image with a certain amount(specified by
% the percentage) of pure back or white pixels

percentage = percentage / 100;
random = rand(size(img));
noisy = img;

for i = 1:size(img,1)
    for j = 1:size(img,2)
        if random(i,j) < percentage/2
            noisy(i,j) = 0;
        elseif random(i,j) < percentage            
            noisy(i,j) = 255;
        end
    end
end


end


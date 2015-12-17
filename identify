function [ results ] = identify( rgbimage, templates, threshold )
%IDENTIFY matches the templates agains the image and returns the found results 
%   results is a cell array containing all templates that were found to
%   match the image
%   image is the image to be evaluated (rgb)
%   templates is a cell array containing the templates (returned by
%   readtemp function)
%   treshold is the correlation coefficient value above which a letter is
%   assumed to be correctly identified

amount = length(templates); % amount of templates in the database (cell array)
image = rgb2gray(rgbimage);
[imheight imwidth] = size(image);
resultmads = cell(1,amount);
resultccs = cell(1,amount);
results = {}; % will later contain the numbers corresponding to the found matching templates
resultsindex = 0; % indicates up to which row the result cell array has been filled

for a=1:amount % for every template in the cell array
    temp = templates{1,a}; % read template
    [height width] = size(temp); % get dimensions
    resultmad = zeros(imheight-height,imwidth-width); %initialise result 
                        % matrix(smaller than image by template dimensions)
    resultcc = zeros(imheight-height,imwidth-width);
    
    for i=1:imheight-height
        for j=1:imwidth-width
            patch = image(i:i+height-1, j:j+width-1); % 'cut' patch from image
            [mad cc] = match(patch, temp); % match patch with template
            resultmad(i,j) = mad;
            resultcc(i,j) = cc;
        end
    end
    
    resultmads{1,a} = resultmad;
    resultccs{1,a} = resultcc;
    
end

for a=1:amount
    ccmatrix = resultccs{1,a}; % for every CC result matrix (for every letter template)
    [maxval maxloc] = max(ccmatrix(:)); % get maximum and location of maximum
    [max_row max_col] = ind2sub(size(ccmatrix), maxloc);
    if maxval > threshold % if the maximum exceeds the predefined threshold
        resultsindex = resultsindex+1;
        results{resultsindex,1} = a; % a corresponds to the position of the 
        % found letter in the alphabet and also in the template cell array
        results{resultsindex,2} = [max_row max_col]; % save position of found letter
    end
end
end

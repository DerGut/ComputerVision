function [ mad cc ] = match( patch, template )
%MATCH Computes Mean Average Distance and Correlation Coefficient of an
%image patch and a template (of the same size!)
%   mad is the Mean Average Distance between the image patch 'patch' and
%   the template 'template' which must have the same dimensions
%   cc is the Correlation Coefficient between the two
%   patch and template must be gray-scale

% MAD
patch = double(patch);
template = double(template);
diff = imabsdiff(patch, template);
mad = sum(sum(diff));
[height width] = size(diff);
mad = mad/(height*width);

% CC
C = cov(patch, template);
covariance = C(2);
stdpatch = std(patch(:));
stdtemplate = std(template(:));
cc = covariance/(stdpatch*stdtemplate);
end

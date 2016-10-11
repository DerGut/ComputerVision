function [ cellarray ] = readtemp( foldername )
%READTEMP Reads in all templates from a specified folder and returns them
%as a cell array
%   folderpath is a string that contains the name of the folder
%   cellarray is a cell array containing the read templates from the folder

images  = dir([foldername filesep '*.png']);
images  = [images dir([foldername filesep '*.jpg'])];
amount = length(images);
cellarray = cell(1,amount);

for i=1:amount
    cellarray{1,i} = rgb2gray(imread(images(i).name));
end
end


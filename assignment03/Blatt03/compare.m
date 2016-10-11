function [ bestmatch ] = compare( img )
%COMPARE Returns the image that is best matched by img
%   Compares img to all three images stored in the global database and returns
%   the one that is most similar (= with the lowest value returned by the
%   function 'similarity')
global IMG1;
global IMG2;
global IMG3;
global CCHAR1;
global CCHAR2;
global CCHAR3;

cchar = colorchar(rgb2hsv(img));
sim1 = similarity(cchar, CCHAR1);
sim2 = similarity(cchar, CCHAR2);
sim3 = similarity(cchar, CCHAR3);
if sim1 < sim2 && sim1 < sim3
    bestmatch = IMG1;
elseif sim2 < sim1 && sim2 < sim3
    bestmatch = IMG2;
else
    bestmatch = IMG3;
end
end


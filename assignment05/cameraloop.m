function cameraloop( cam, k )
%CAMERALOOP A camera loop that recognizes the user in front of the cam
%   This camera loop compares the input to the stored images and displays
%   the most similar one

global KEY_IS_PRESSED
KEY_IS_PRESSED = 0;
fig = figure;
set(fig, 'KeyPressFcn', @myKeyPressFcn);
while ~KEY_IS_PRESSED
    subplot(1,2,1);
    title('Input');
    img = snapshot(cam);
    imshow(img);
    
    subplot(1,2,2);
    title('k-means');
    [idx, C] = kmeans(img2array(snapshot(cam)), k)
    imshow(labelClusters(size(img,1), size(img,2), size(img,3), idx, C));
end
close(fig);
end


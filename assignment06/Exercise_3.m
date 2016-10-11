clear
clc

cam = webcam;
pause(1)

%% 1) Single snapshot
figure(1)

shot = snapshot(cam);
shot = imresize(shot, 0.67);
subplot(1,2,1);
imshow(shot);

[centers, radii] = imfindcircles(shot, [10 20], ...
                            'Method', 'TwoStage', ...
                            'ObjectPolarity', 'dark', ...
                            'Sensitivity', 0.7, ...
                            'EdgeThreshold', 0.01);
                        
subplot(1,2,2);
imshow(shot);
viscircles(centers, radii, 'EdgeColor', 'b');

%% 2) With Preprocessing
figure(2)

% Prewitt filter
prewittH = imfilter(shot, fspecial('prewitt'));
prewittV = imfilter(shot, fspecial('prewitt')');
prewitt = max(prewittH, prewittV);

subplot(3,2,1);
imshow(prewitt);
[centers, radii] = imfindcircles(prewitt, [10 20], ...
                            'Method', 'TwoStage', ...
                            'ObjectPolarity', 'bright', ...
                            'Sensitivity', 0.8, ...
                            'EdgeThreshold', 0.01);            
subplot(3,2,2);
imshow(shot);
viscircles(centers, radii, 'EdgeColor', 'b');

% Sobel filter
sobelH = imfilter(shot, fspecial('sobel'));
sobelV = imfilter(shot, fspecial('sobel')');
sobel = max(sobelH, sobelV);

subplot(3,2,3);
imshow(sobel);
[centers, radii] = imfindcircles(sobel, [10 20], ...
                            'Method', 'TwoStage', ...
                            'ObjectPolarity', 'bright', ...
                            'Sensitivity', 0.8, ...
                            'EdgeThreshold', 0.01);            
subplot(3,2,4);
imshow(shot);
viscircles(centers, radii, 'EdgeColor', 'b');

% Canny edge detector
bw = im2bw(shot);
canny = edge(bw, 'canny', 0.99);

subplot(3,2,5);
imshow(canny);
[centers, radii] = imfindcircles(canny, [10 20], ...
                            'Method', 'TwoStage', ...
                            'ObjectPolarity', 'bright', ...
                            'Sensitivity', 0.8, ...
                            'EdgeThreshold', 0.01);            
subplot(3,2,6);
imshow(shot);
viscircles(centers, radii, 'EdgeColor', 'b');


%% 4) Additional knowledge
figure(4)

for frame = 1:10

    shot = snapshot(cam);
    [centers, radii] = imfindcircles(shot, [10 20], ...
                                'Method', 'PhaseCode', ...
                                'ObjectPolarity', 'bright', ...
                                'Sensitivity', 0.95, ...
                                'EdgeThreshold', 0.001);  

%     The distance of two eyes is roughly the width of one eye -
%     proportions
    matches = zeros(size(centers));
    dist = pdist(centers);
    for i = 1:size(dist,2)
        if radii( uint16( (i * 2 / size(centers,1) ) + 1),:) ...
                < dist(i) + 2 ...
                && radii( uint16( ( i * 2 / size(centers,1) ) + 1),:) ...
                > dist(i) - 2
            
            matches(uint16((i*2/size(centers,1))+1),:) = ...
                centers(uint16((i*2/size(centers,1))+1),:);

           
        end
    end

    [row, columns] = find(matches);


    imshow(shot)
    viscircles(matches, radii, 'EdgeColor', 'b');

end % for frame
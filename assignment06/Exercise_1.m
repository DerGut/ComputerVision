clear
clc

%% a) HT of single point
figure(1)

img = zeros(100, 100);

img = zeros(100, 100);
j = 30;
for i = 1:100
    
    img = zeros(100, 100);
    
    if i == 50
        for j = 30:80
        
        img = zeros(100, 100);
        img(j,i) = 1;
        
        subplot(1,2,1)
        imshow(img)
        xlabel('x')
        ylabel('y')
        title('original')

        htPoint = hough(img);

        subplot(1,2,2)
        imshow(htPoint)
        xlabel('\Theta')
        ylabel('r')
        title('Hough Transform')
        
        pause(0.0001)
        
        end
    end

    img(j,i) = 1;
    
    subplot(1,2,1)
    imshow(img)
    title('original')
    xlabel('x')
    ylabel('y')

    htPoint = hough(img);

    subplot(1,2,2)
    imshow(htPoint)
    title('Hough Transform')
    xlabel('\Theta')
    ylabel('r')

    pause(0.0001)

end

%% b) Multiple points in a row
figure(2)
img = zeros(100, 100);

points = [30 50;
          40 50;
          50 50;
          60 50;
          70 50];
      
for i = 1:size(points,1)
    img(points(i,1),points(i,2)) = 1;
end

subplot(1,2,1)
imshow(img)
title('original')
xlabel('x')
ylabel('y')

htPoint = hough(img);

subplot(1,2,2)
imshow(htPoint)
title('Hough Transform')
xlabel('\Theta')
ylabel('r')


pause(0.0001)
    

%% c) Single line

figure(3)
img = zeros(100, 100);

% y = mx+y0

for i = 0.1:0.01:2
    img = zeros(100, 100);
    for i = 1:100
        row = int8(i*i + i*30);
        img(row,i) = 1;
    end
    subplot(1,2,1)
    imshow(img);
    title('Original')
    subplot(1,2,2)
    imshow(hough(img))
    title('Hough Transform')
    
    pause(0.001)
end

for i = 1:100
    img = zeros(100, 100);
    for i = 1:100
        row = int8(i + i);
        img(row,i) = 1;
    end
    subplot(1,2,1)
    imshow(img);
    title('Original')
    subplot(1,2,2)
    imshow(hough(img))
    title('Hough Transform')
    
    pause(0.001)
end

%% d) Complex figures

figure(4)

% Square
img = zeros(100,100);
for i = 20:80
   img(20,i) = 1;
   img(80,i) = 1;
   img(i,20) = 1;
   img(i,80) = 1;
end

subplot(4,2,1)
imshow(img)
subplot(4,2,2)
imshow(hough(img))


% Circle
img = zeros(100,100)


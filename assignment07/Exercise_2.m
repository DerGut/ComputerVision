
L = 1000;

func1 = sin(2*pi*(1:L)/L);
func2 = zeros(1,L); func2(40:60)=1;
func3 = gausswin(L,1./0.1)';

% func1
subplot(3,5,1)
plot(func1)
title('sin(2*pi*(1:L)/L)')

g1 = dft1(func1);

subplot(3,5,2)
plot(abs(g1))
title('Magnitude')

subplot(3,5,3)
plot(angle(g1))
title('Phase')

g1 = fft(func1);

subplot(3,5,4)
plot(abs(g1))
title('Magnitude')

subplot(3,5,5)
plot(angle(g1))
title('Phase')


% func2
subplot(3,5,6)
plot(func2)
title('zeros(1,L); func2(40:60)=1')

g2 = dft1(func2);

subplot(3,5,7)
plot(abs(g2) .* hann(size(g2,1)))
title('Magnitude')

subplot(3,5,8)
plot(angle(g2))
title('Phase')

g2 = fft(func2);

subplot(3,5,9)
plot(abs(g2))
title('Magnitude')

subplot(3,5,10)
plot(angle(g2))
title('Phase')

% func3
subplot(3,5,11)
plot(func3)
title('gausswin(L,1./0.1)')

g3 = dft1(func3);

subplot(3,5,12)
plot(abs(g3))
title('Magnitude')

subplot(3,5,13)
plot(angle(g3))
title('Phase')

g3 = fft(func3);

subplot(3,5,14)
plot(abs(g3))
title('Magnitude')

subplot(3,5,15)
plot(angle(g3))
title('Phase')

%% b)

img = imread('dolly.png');

array = reshape(img,[1,numel(img)]);
ft = dft1(array);

ft = reshape(ft, [size(img,1),size(img,2)]);
imshow(ft)


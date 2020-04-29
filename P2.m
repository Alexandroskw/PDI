%% Practica 2 Combolucion lineal y circular utulizando la DFT 
%Lugo Garcia Julio Cesar 
%Perez Facio Javier Alejadro 
% Profesor: Boris Escalante Ramirez 
clc; clear all; close all;
%% 1
im_data = imread("lena_color_512.tif");
im_gray = rgb2gray(im_data);
im_original = im_gray (:,:,1);
figure(1)
colormap("gray");
imagesc(im_gray);
title("Original Image")

filter_5x5 = (1/25)*ones(5,5);
filter_7x7 = (1/49)*ones(7,7);
filter_9x9 = (1/81)*ones(9,9);

im_filtered = conv2(im_original,filter_5x5,'full');

figure(2)
colormap('gray')
imagesc(im_filtered);
title("Filred by 5x5 Image")

im_filtered2 = conv2(im_original,filter_7x7,'full');

figure(3)
colormap('gray')
imagesc(im_filtered2);
title("Filred by 7x7 Image")

im_filtered3 = conv2(im_original,filter_9x9,'full');

figure(4)
colormap('gray')
imagesc(im_filtered3);
title("Filred by 9x9 Image")

im_filtered = conv2(im_original,filter_5x5,'same');

figure(5)
colormap('gray')
imagesc(im_filtered);
title("Filred by 5x5 Image")

im_filtered2 = conv2(im_original,filter_7x7,'same');

figure(6)
colormap('gray')
imagesc(im_filtered2);
title("Filred by 7x7 Image")

im_filtered3 = conv2(im_original,filter_9x9,'same');

figure(7)
colormap('gray')
imagesc(im_filtered3);
title("Filred by 9x9 Image")

im_filtered = conv2(im_original,filter_5x5,'valid');

figure(8)
colormap('gray')
imagesc(im_filtered);
title("Filred by 5x5 Image")

im_filtered2 = conv2(im_original,filter_7x7,'valid');

figure(9)
colormap('gray')
imagesc(im_filtered2);
title("Filred by 7x7 Image")

im_filtered3 = conv2(im_original,filter_9x9,'valid');

figure(10)
colormap('gray')
imagesc(im_filtered3);
title("Filred by 9x9 Image")


%% 2
j = double(im_original);
t = abs(fft2(j));
y = log10(t);
f = fftshift(y);
y1 = log10(f);

figure()
colormap('gray');
imagesc(im_original);
title('IMG original');

figure()
colormap('gray');
imagesc(y1);
title('IMG con DFT');
%% 3
[mA, nA] = size(im_original);

filt_im = fft2(im_original, mA, nA);
filt_5x5F = fft2(filter_5x5, mA, nA);
filt_7x7F = fft2(filter_7x7, mA, nA);
filt_9x9F = fft2(filter_9x9, mA, nA);

im_filt = ifft2(filt_im.*filt_5x5F);
im_filt2 = ifft2(filt_im.*filt_7x7F);
im_filt3 = ifft2(filt_im.*filt_9x9F);

figure()
colormap('gray')
imagesc(im_filt);
title("Convolution filter 5x5 with image")

figure()
colormap('gray')
imagesc(im_filt2);
title("Convolution filter 7x7 with image")

figure()
colormap('gray')
imagesc(im_fil3);
title("Convolution filter 9x9 with image")


%% 4
[mA, nA] = size(im_original);

% filt_im = fft2(im_original, mA, nA);
% filt_5x5F = fft2(filter_5x5, mA, nA);
% filt_7x7F = fft2(filter_7x7, mA, nA);
% filt_9x9F = fft2(filter_9x9, mA, nA);

im_convC = ifft2(fft2(im_original).*fft2(filter_5x5,mA,nA));
im_convC2 = ifft2(fft2(im_original).*fft2(filter_7x7,mA,nA));
im_convC3 = ifft2(fft2(im_original).*fft2(filter_9x9,mA,nA));

figure()
colormap('gray')
imagesc(im_convC);
title("Circular convolution filter 5x5 with image")

figure()
colormap('gray')
imagesc(im_convC2);
title("Circular convolution filter 7x7 with image")

figure()
colormap('gray')
imagesc(im_convC3);
title("Circular convolution filter 9x9 with image")

%% 5
filter_9x9 = (1/81)*ones(9,9);

[mA, nA] = size(im_original);

 filt_im = fft2(im_original, mA, nA);
 filt_9x9F = fft2(filter_9x9, mA, nA);

im_filtered = conv2(im_original,filter_9x9,'same');
im_filt = ifft2(filt_im.*filt_9x9F);
im_convC = ifft2(fft2(im_original).*fft2(filter_9x9,mA,nA));

figure()
colormap('gray')
imagesc(im_filtered);
title("Linear convolution filter 9x9 with image")

figure()
colormap('gray')
imagesc(im_filt);
title("Convolution filter 9x9 with image")

figure()
colormap('gray')
imagesc(im_convC);
title("Circular convolution filter 9x9 with image")
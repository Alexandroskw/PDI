%% Practica 4 Filtros Espaciales 
%Lugo Garcia Julio Cesar 
%Perez Facio Javier Alejadro 
% Profesor: Boris Escalante Ramirez 
clc; clear all; close all;
%% 1
im_data = imread("lena_color_512.tif");
im_noise = imnoise(im_data, 'gaussian');

im_gray = rgb2gray(im_data);
im_original = im_gray (:,:,1);

im_gray2 = rgb2gray(im_noise);
im_original2 = im_gray (:,:,1);


figure(1)
colormap("gray");
imagesc(im_gray);
title("Original Image")

figure(2)
colormap("gray");
imagesc(im_gray2);
title("Image with noise")

%2

filter_3x3 = (1/9)*ones(3,3);
filter_5x5 = (1/25)*ones(5,5);
filter_7x7 = (1/49)*ones(7,7);
filter_11x11 = (1/121)*ones(11,11);

[mA, nA] = size(im_original);
[jA, kA] = size(im_original2);

im_filt = ifft2(fft2(im_original).*fft2(filter_3x3,mA,nA));
im_filt2 = ifft2(fft2(im_original).*fft2(filter_5x5,mA,nA));
im_filt3 = ifft2(fft2(im_original).*fft2(filter_7x7,mA,nA));
im_filt4 = ifft2(fft2(im_original).*fft2(filter_11x11,mA,nA));

im_filtN = ifft2(fft2(im_original2).*fft2(filter_3x3,jA,kA));
im_filtN2 = ifft2(fft2(im_original2).*fft2(filter_5x5,jA,kA));
im_filtN3 = ifft2(fft2(im_original2).*fft2(filter_7x7,jA,kA));
im_filtN4 = ifft2(fft2(im_original2).*fft2(filter_11x11,jA,kA));

figure()
colormap('gray')
imagesc(im_filt);
title("Image & 3x3 filter")

figure()
colormap('gray')
imagesc(im_filt2);
title("Image & 5x5 filter")

figure()
colormap('gray')
imagesc(im_filt3);
title("Image & 7x7 filter")

figure()
colormap('gray')
imagesc(im_filt4);
title("Image & 11x11 filter")


figure()
colormap('gray')
imagesc(im_filtN);
title("Image with noise & 3x3 filter")

figure()
colormap('gray')
imagesc(im_filtN2);
title("Image with noise & 5x5 filter")

figure()
colormap('gray')
imagesc(im_filtN3);
title("Image with noise & 7x7 filter")

figure()
colormap('gray')
imagesc(im_filtN4);
title("Image with noise & 11x11 filter")

% 3

A = [1,3,3,1];
B = [1,5,10,10,5,1];
C = [ 1,7,21,35,35,21,7,1];
D = [1,11,55,165,330,462,462,330,165,55,11,1 ];

f_bin_3x3 = (1/9)*(A.' * A);
f_bin_5x5 = (1/25)*(B.' * B);
f_bin_7x7 = (1/49)*(C.' * C);
f_bin_11x11 = (1/121)*(D.' * D);

im_filtB = ifft2(fft2(im_original).*fft2(f_bin_3x3,mA,nA));
im_filtB2 = ifft2(fft2(im_original).*fft2(f_bin_5x5,mA,nA));
im_filtB3 = ifft2(fft2(im_original).*fft2(f_bin_7x7,mA,nA));
im_filtB4 = ifft2(fft2(im_original).*fft2(f_bin_11x11,mA,nA));

im_filtBN = ifft2(fft2(im_original2).*fft2(f_bin_3x3,jA,kA));
im_filtBN2 = ifft2(fft2(im_original2).*fft2(f_bin_5x5,jA,kA));
im_filtBN3 = ifft2(fft2(im_original2).*fft2(f_bin_7x7,jA,kA));
im_filtBN4 = ifft2(fft2(im_original2).*fft2(f_bin_11x11,jA,kA));

figure()
colormap('gray')
imagesc(im_filtB);
title("Image & 3x3 binomial filter")

figure()
colormap('gray')
imagesc(im_filtB2);
title("Image & 5x5 binomial filter")

figure()
colormap('gray')
imagesc(im_filtB3);
title("Image & 7x7 binomial filter")

figure()
colormap('gray')
imagesc(im_filtB4);
title("Image & 11x11 binomial filter")


figure()
colormap('gray')
imagesc(im_filtBN);
title("Image with noise & 3x3 binomial filter")

figure()
colormap('gray')
imagesc(im_filtBN2);
title("Image with noise & 5x5 binomialfilter")

figure()
colormap('gray')
imagesc(im_filtBN3);
title("Image with noise & 7x7 binomial filter")

figure()
colormap('gray')
imagesc(im_filtBN4);
title("Image with noise & 11x11 binomial filter")
%% 4

E = [1, -1];

prewitt_x_filter = [-1, 0, 1; -2, 0, 2; -1, 0, 1];
prewitt_y_filter = [-1, -2, -1; 0, 0, 0; 1, 2, 1];

sobel_x_filter = [-1, 0, 1; -2, 0, 2; -1, 0, 1];
sobel_y_filter = [-1, -2, -1; 0, 0, 0; 1, 2, 1];

im_filtB = ifft2(fft2(im_original).*fft2(E,mA,nA));
im_filtBN = ifft2(fft2(im_original2).*fft2(E,jA,kA));

im_filtPX = ifft2(fft2(im_original).*fft2(prewitt_x_filter,mA,nA));
im_filtPY = ifft2(fft2(im_original).*fft2(prewitt_y_filter,mA,nA));

im_filtPXN = ifft2(fft2(im_original2).*fft2(prewitt_x_filter,jA,kA));
im_filtPYN = ifft2(fft2(im_original2).*fft2(prewitt_y_filter,jA,kA));


im_filtSX = ifft2(fft2(im_original).*fft2(sobel_x_filter,mA,nA));
im_filtSXN = ifft2(fft2(im_original2).*fft2(sobel_x_filter,jA,kA));

im_filtSY = ifft2(fft2(im_original).*fft2(sobel_y_filter,mA,nA));
im_filtSYN = ifft2(fft2(im_original2).*fft2(sobel_y_filter,jA,kA));

figure()
colormap('gray')
imagesc(im_filtB);
title("Image & [1,-1] bloq filter")

figure()
colormap('gray')
imagesc(im_filtBN);
title("Image with noise & [1, -1] bloq filter")

figure()
colormap('gray')
imagesc(im_filtPX);
title("Image & Prewitt X filter")

figure()
colormap('gray')
imagesc(im_filtPXN);
title("Image with noise & Prewitt X filter")

figure()
colormap('gray')
imagesc(im_filtPY);
title("Image & Prewitt y filter")

figure()
colormap('gray')
imagesc(im_filtPYN);
title("Image with noise & Prewitt Y filter")

figure()
colormap('gray')
imagesc(im_filtSX);
title("Image & Sobel X  filter")

figure()
colormap('gray')
imagesc(im_filtSXN);
title("Image with noise & Sobel X filter")

figure()
colormap('gray')
imagesc(im_filtSY);
title("Image & Sobel Y  filter")

figure()
colormap('gray')
imagesc(im_filtSYN);
title("Image with noise & Sobel Y filter")



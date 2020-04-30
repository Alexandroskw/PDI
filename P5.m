clc; clear all; close all;

im_data = imread("pentagon256x256.tif");

subplot(1, 2, 1)
imshow(im_data);
title("Original Image")

szImage = size(im_data);
szImage2 = size(im_data);

dsz = 2*szImage;
dsz2 = 2*szImage2;

B = zeros(dsz);
C = zeros();

pos = 1;
cont = 0;

subplot(1, 2, 2)
for i=1:szImage
    pos = i+cont;
    B(pos,:) = double(i);
    cont = cont + (2-1);
    ImF = fftshift(fft2(i));
end
Im = log(1.0 + ImF);
imagesc(Im);

%szB = size(B);

%for i=1:szB(2)
%    pos = i+cont;
%    C(:, pos) = B(:, i);
%    cont = cont+(2-1);
%end
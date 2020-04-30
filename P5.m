clc; clear all; close all;

im_data = imread("pentagon256x256.tif");

subplot(1, 2, 1)
imshow(im_data);
title("Original Image")

szImage = size(im_data);
szImage2 = size(im_data);

B = zeros(2*szImage(1), szImage(2));
C = zeros((2*szImage(1)), (2*szImage(2)));

pos = 1;
cont = 0;

subplot(1, 2, 2)

for i=1:szImage(1)
    pos = i+cont;
    B(pos,:) = im_data(i,:);
    cont = cont + (2-1);
end

szB = size(B);

for i=1:szImage(2)
    pos = i+cont;
    C(:, pos) = B(:, i);
    cont = cont+(2-1);
end

imagesc(C);
colormap ('gray');
title("2x2")
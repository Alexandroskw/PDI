%% 1
clc; clear all; close all;

im_data = imread("pentagon256x256.tif");

figure(1)
imshow(im_data);
title("Original Image")

%2x2
szImage = size(im_data);
szImage2 = size(im_data);

B = zeros(2*szImage(1), szImage(2));
C = zeros((2*szImage(1)), (2*szImage(2)));

pos = 1;
cont = 0;

figure(2)
for i=1:szImage(1)
    pos = i+cont;
    B(pos,:) = im_data(i,:);
    cont = cont + (2-1);
end

pos1 = 1;
cont1 = 0;

%szB = size(B);

for i=1:szImage(2)
    pos1 = i+cont1;
    C(:, pos1) = B(:, i);
    cont1 = cont1+(2-1);
end

inter = uint8(conv2(C, [1 1], 'same'));
dft = fft2(C);

colormap ('gray');
imagesc(log10(abs(fftshift(dft))));
title("2x2")

% 4x4
B1 = zeros(4*szImage(1), szImage(2));
C1 = zeros((4*szImage(1)), (4*szImage(2)));

p = 1;
c = 0;

figure(3)
for i=1:szImage2(1)
    p = i+c;
    B1(p,:) = im_data(i,:);
    c = c + (4-1);
end

p1 = 1;
c1 = 0;

for i=1:szImage(2)
    p1 = i+c1;
    C1(:,p1) = B1(:,i);
    c1 = c1+(4-1);
end

inter2 = uint8(conv2(C1, [1 1], 'same'));
dft = fft2(C1);

colormap ('gray');
imagesc(log10(abs(fftshift(dft))));
title("4x4")

%% 2

% Ord 0
szImage_2 = size(im_data);
szImage2_2 = size(im_data);

B = zeros(2*szImage_2(1), szImage_2(2));
C = zeros((2*szImage_2(1)), (2*szImage_2(2)));

pos_2 = 1;
cont_2 = 0;

figure(2)
for i=1:szImage_2(1)
    pos_2 = i+cont_2;
    B(pos_2,:) = im_data(i,:);
    cont_2 = cont_2 + (2-1);
end

pos1_2 = 1;
cont1_2 = 0;

for i=1:szImage(2)
    pos1 = i+cont1_2;
    C(:, pos1_2) = B(:, i);
    cont1_2 = cont1_2+(2-1);
end

inter_2 = uint8(conv2(C, [0 0], 'same'));
dft = fft2(C);

colormap ('gray');
imagesc(log10(abs(fftshift(dft))));
title("2x2")

%Lineal

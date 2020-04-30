%% Practica 5 Interpolacion  
%Lugo Garcia Julio Cesar 
%Perez Facio Javier Alejadro 
% Profesor: Boris Escalante Ramirez 
clc; clear all; close all;

%% 3
im_data = imread("pentagon256x256.tif");
subplot(2,2,1)
imshow(im_data);
title("Original Image")


szImage = size(im_data);
T = 2;
T_4 = 4;

im_DFT = fft2(im_data);

subplot(2,2,2)
colormap('gray')
imagesc(log10(abs(fftshift(im_DFT))));
title("DFT original image")

A = zeros((T*szImage(1)),(T*szImage(2)));
im_center = fftshift(im_DFT);
szA=size(A);

A(((szA(1)-szImage(1))/2)+1:(((szA(1)-szImage(1))/2)+1)+szImage(1)-1,((szA(2)-szImage(2))/2)+1:(((szA(2)-szImage(2))/2)+1)+szImage(2)-1)=im_center;

im_shift1 = fftshift(A);
im_t2x2 = abs(ifft2(im_shift1));


subplot(2,2,3)
colormap('gray')
imagesc(log10(abs(fftshift(im_shift1))));
title("DFT T = 2x2")

B =zeros((T_4*szImage(1)),(T_4*szImage(2)));
szB=size(B);
B(((szB(1)-szImage(1))/2)+1:(((szB(1)-szImage(1))/2)+1)+szImage(1)-1,((szB(2)-szImage(2))/2)+1:(((szB(2)-szImage(2))/2)+1)+szImage(2)-1)=im_center;

im_shift = fftshift(B);
im_t4x4 = abs(ifft2(im_shift));

subplot(2,2,4)
colormap('gray')
imagesc(log10(abs(fftshift(im_shift))));
title("DFT T = 4x4")

im_data = imread("pentagon256x256.tif");

subplot(2, 2, 1)
imshow(im_data);

interO = uint8(conv2(im_data, [1 1], 'same'));
dft = fft2(im_data);
colormap ('gray');
imagesc(log10(abs(fftshift(dft))));
title("Original DFT")

%2x2
szImage = size(im_data);
szImage2 = size(im_data);

B = zeros(2*szImage(1), szImage(2));
C = zeros((2*szImage(1)), (2*szImage(2)));

pos = 1;
cont = 0;

subplot(2, 2, 2)
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
dft2 = fft2(C);

colormap ('gray');
imagesc(log10(abs(fftshift(dft2))));
title("2x2")

% 4x4
B1 = zeros(4*szImage2(1), szImage2(2));
C1 = zeros((4*szImage2(1)), (4*szImage2(2)));

p = 1;
c = 0;

subplot(2, 1, 2)
for i=1:szImage2(1)
    p = i+c;
    B1(p,:) = im_data(i,:);
    c = c + (4-1);
end

p1 = 1;
c1 = 0;

for i=1:szImage2(2)
    p1 = i+c1;
    C1(:,p1) = B1(:,i);
    c1 = c1+(4-1);
end

inter2 = uint8(conv2(C1, [1 1], 'same'));
dft4 = fft2(C1);

colormap ('gray');
imagesc(log10(abs(fftshift(dft4))));
title("4x4")

%% 2

% Ord 0 2x2
szImageL = size(im_data);
szImage2L = size(im_data);

BL = zeros(2*szImageL(1), szImageL(2));
CL = zeros((2*szImageL(1)), (2*szImageL(2)));

posL = 1;
contL = 0;

subplot(3, 2, 2)
for i=1:szImageL(1)
    posL = i+contL;
    BL(posL,:) = im_data(i,:);
    contL = contL + (2-1);
end

pos1L = 1;
cont1L = 0;

for i=1:szImageL(2)
    pos1L = i+cont1L;
    CL(:, pos1L) = BL(:, i);
    cont1L = cont1L+(2-1);
end

interL = uint8(conv2(CL, [0 0], 'same'));
dft = fft2(CL);

colormap ('gray');
imagesc(log10(abs(fftshift(dft))));
title("2x2 Ord 0")

% 4 ord 0
BL = zeros(4*szImage2L(1), szImage2L(2));
CL = zeros((4*szImage2L(1)), (4*szImage2L(2)));

posL4 = 1;
contL4 = 0;

figure(6)
for i=1:szImage2L(1)
    posL4 = i+contL4;
    BL(posL4,:) = im_data(i,:);
    contL4 = contL4 + (4-1);
end

pos1L4 = 1;
cont1L4 = 0;

for i=1:szImage2L(2)
    pos1L4 = i+cont1L4;
    CL(:, pos1L4) = BL(:, i);
    cont1L4 = cont1L4+(4-1);
end

interL4 = uint8(conv2(CL, [0 0], 'same'));
dft = fft2(CL);

colormap ('gray');
imagesc(log2(abs(fftshift(dft))));
title("4x4 Ord 0")

% Lineal 2x2
szImage_2L = size(im_data);
szImage2_2L = size(im_data);

BL = zeros(2*szImage_2L(1), szImage_2L(2));
C_2L = zeros((2*szImage_2L(1)), (2*szImage_2L(2)));

pos_2L = 1;
cont_2L = 0;

subplot(3, 2, 2)
for i=1:szImage_2L(1)
    pos_2L = i+cont_2L;
    BL(pos_2L,:) = im_data(i,:);
    cont_2L = cont_2L + (2-1);
end

pos1_2L = 1;
cont1_2L = 0;

for i=1:szImage_2L(2)
    pos1_2L = i+cont1_2L;
    C_2L(:, pos1_2L) = BL(:, i);
    cont1_2L = cont1_2L+(2-1);
end

inter_2L = uint8(conv2(C_2L, [1/2 1/2 1], 'same'));
dft = fft2(C_2L);

colormap ('gray');
imagesc(log10(abs(fftshift(dft))));
title("2x2 Linear")

% 4x4
BL = zeros(4*szImage2_2L(1), szImage2_2L(2));
C_2L = zeros((4*szImage2_2L(1)), (4*szImage2_2L(2)));

pos4_2L = 1;
cont_2L = 0;

figure(8)
for i=1:szImage2_2L(1)
    pos4_2L = i+cont_2L;
    BL(pos4_2L,:) = im_data(i,:);
    cont_2L = cont_2L + (2-1);
end

pos12_2L = 1;
cont12_2L = 0;

for i=1:szImage2_2L(2)
    pos12_2L = i+cont12_2L;
    C_2L(:, pos12_2L) = BL(:, i);
    cont12_2L = cont12_2L+(2-1);
end

inter2_2L = uint8(conv2(C_2L, [1/4 1 1/4], 'same'));
dft = fft2(C_2L);

colormap ('gray');
imagesc(log10(abs(fftshift(dft))));
title("4x4 Linear")

% cubico 2x2
szImage_2C = size(im_data);
szImage2_2C = size(im_data);

BC = zeros(2*szImage_2C(1), szImage_2C(2));
C_2C = zeros((2*szImage_2C(1)), (2*szImage_2C(2)));

pos_2C = 1;
cont_2C = 0;

subplot(3, 1, 2)
for i=1:szImage_2C(1)
    pos_2C = i+cont_2C;
    BL(pos_2C,:) = im_data(i,:);
    cont_2C = cont_2C + (2-1);
end

pos1_2C = 1;
cont1_2C = 0;

for i=1:szImage_2C(2)
    pos1_2C = i+cont1_2C;
    C_2C(:, pos1_2C) = BC(:, i);
    cont1_2C = cont1_2C+(2-1);
end

inter2_C = uint8(conv2(C_2C, [1/2*2 1/2 1 1/2 1/2*2], 'same'));
dft = fft2(C_2C);

colormap ('gray');
imagesc(log10(abs(fftshift(dft))));
title("2x2 Cubic")

% 4x4

BC = zeros(2*szImage2_2C(1), szImage2_2C(2));
C_2C = zeros((2*szImage2_2C(1)), (2*szImage2_2C(2)));

pos_4C = 1;
cont_4C = 0;

figure(10)
for i=1:szImage_2C(1)
    pos_4C = i+cont_4C;
    BL(pos_4C,:) = im_data(i,:);
    cont_4C = cont_4C + (2-1);
end

pos1_4C = 1;
cont1_4C = 0;

for i=1:szImage_2C(2)
    pos1_4C = i+cont1_4C;
    C_2C(:, pos1_4C) = BC(:, i);
    cont1_4C = cont1_4C+(2-1);
end

inter4_C = uint8(conv2(C_2C, [1/2*2 1/2 1 1/2 1/2*2], 'same'));
dft = fft2(C_2C);

colormap ('gray');
imagesc(log10(abs(fftshift(dft))));
title("4x4 Cubic")

% Zoom

dft = fft2(im_data);
colormap ('gray');
plot((1:20), (1:20));
imagesc(log10(abs(fftshift(dft))));

dft2 = fft2(C);
plot((1:20), (1:20));
imagesc(log10(abs(fftshift(dft2))));

dft4 = fft2(C1);
plot((1:20), (1:20))
imagesc(log10(abs(fftshift(dft4))));

dft = fft2(CL);
plot((1:20), (1:20));
imagesc(log10(abs(fftshift(dft))));

dft = fft2(CL);
plot((1:20), (1:20))
imagesc(log2(abs(fftshift(dft))));

dft = fft2(C_2L);
plot((1:20), (1:20))
imagesc(log10(abs(fftshift(dft))));

dft = fft2(C_2L);
plot((1:20), (1:20))
imagesc(log10(abs(fftshift(dft))));

dft = fft2(C_2C);
plot((1:20), (1:20))
imagesc(log10(abs(fftshift(dft))));

dft = fft2(C_2C);
plot((1:20), (1:20))
imagesc(log10(abs(fftshift(dft))));

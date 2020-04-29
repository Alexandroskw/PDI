%% Practica 3 Ecualizacion y especificacion de histograma 
%Lugo Garcia Julio Cesar 
%Perez Facio Javier Alejadro 
%Profesor: Boris Escalante Ramirez 
clc; clear all; close all;

%% Ecualización del histograma de una imagen de bajo contraste

% a)
I=imread('pinos512.tif');
figure
subplot(1, 2, 1)
imshow(I)
subplot(1, 2, 2)
imhist(I)

imEspec=histeq(I);

%% b)
figure
subplot(1,2,1)
imshow(imEspec)
subplot(1, 2, 2)
imhist(imEspec)

%% c)
for counter=[128 64 32 16 8 2]
    imEspec1=histeq(I, counter);
    figure
    subplot(1, 2, 1)
    imshow(imEspec1)
    subplot(1, 2, 2)
    imhist(imEspec1, counter)
end

%% Union de la imagen
partA = imread("zonaA_b5.tif");
partB = imread("zonaB_b5.tif");


cropA = imcrop(partA, [0,0,1230,1500]);
overlap = imcrop (partA, [1231,0,531,1500]);
cropB = imcrop(partB, [1231,0,1269,1500]);

mosaic = [cropA overlap cropB];

OverlapHistogram = imhist(overlap); 
cropBesp = histeq(cropB,OverlapHistogram);

fullMosaic = [cropA overlap cropBesp];

figure(101)
subplot(1, 2, 1)
imshow(fullMosaic);
subplot(1, 2, 2)
imhist(fullMosaic)

for counter=[128 64 32 16 8 2]
    imEspec1=histeq(fullMosaic, counter);
    figure
    subplot(1, 2, 1)
    imshow(imEspec1)
    subplot(1, 2, 2)
    imhist(imEspec1, counter)
end
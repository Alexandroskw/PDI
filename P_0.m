%% Script 
% Lugo Garcia Julio Cesar 
% Perez Facio Javier Alejandro 
% Procesamiento Digital de Imagenes
% Boris Escalante Ramirez 

clc; clear all; close all;

%% 1

mri = imread('mri.jpg'); 
[r,g,b] = split(mri); 

k = zeros(size(mri,1), size(mri,2), class(mri));
colorR = cat(3, r, k, k);
colorG = cat(3, k, g, k);
colorB = cat(3, k, k, b);

subplot(2,2,1)
imshow(r)
montage({r, colorR}, 'ThumbnailSize',[]);
title("Canal Rojo")

subplot(2,2,2)
imshow(g)
montage({g, colorG}, 'ThumbnailSize',[]);
title("Canal Verde")

subplot(2,2,3)
imshow(b)
montage({b, colorB}, 'ThumbnailSize',[]);
title("Canal Azul")

subplot(2,2,4)
imshow(mri)
title("Imagen Original")

%% 2. 
rgb=imread('retinaRGB.jpg');
subplot(7, 4, 2);
I=rgb2gray(rgb);
imshow(I);
I2=rgb2ycbcr(rgb);
subplot(7, 4, 3);
imshow(I2);
I3=rgb2hsv(rgb);
subplot(7, 4, 4);
imshow(I3);

%% 3.
original = imread('cta_scan_index.bmp'); 

imSize = size(original);
M = imSize(1)/3; N = imSize(2)/3;

imCorte1 = imcrop(original, [0 N M N]);
imCorte2 = imcrop(original, [50 50 200 100]);

figure(2); subplot (1,3,1)
montage(imCorte1, 'ThumbnailSize',[]);
title("Imagen cortada a un tercio")

figure(2); subplot (1,3,2)
montage(imCorte2, 'ThumbnailSize',[]);
title("Corte aleatorio")

figure(2); subplot (1,3,3)
imshow(original)
title("Imagen original")
R = imcrop(cut,[75 68 130 112]);
subplot(7, 4, 7);
imshow(R);

%% 5.
abs=imread('abdomen.png');
subplot(2,1,1);
image(abs);
title('Imagen con comando image')
subplot(2,1,2);
imagesc(abs);
title('Imagen con comando imagesc')
%% 6.
col = imread('retinaRGB.jpg');
[r,g,b] = imsplit(col);

k = zeros(size(col,1), size(col,2), class(col));
colorR = cat(3, r, r, k);
colorG = cat(3, g, k, g);
colorB = cat(3, k, b, b);

subplot(2,2,1)
montage({r, colorR}, 'ThumbnailSize',[]);
title("Amarillo")

subplot(2,2,2)
montage({g, colorG}, 'ThumbnailSize',[]);
title("Magenta")

subplot(2,2,3)
montage({b, colorB}, 'ThumbnailSize',[]);
title("Cian")

subplot(2,2,4)
imshow(col)
title("Imagen Original")
%% 8
imdata = imread('cta_scan_index.bmp');

J = imrotate(imdata,45);

subplot(3,1,1)
imshow(J);
title('Rotacion de 45°')
K = imrotate(imdata,90);

subplot(3,1,2)
imshow(K);
title('Rotacion de 90°')
L = imrotate(imdata,180);

subplot(3,1,3)
imshow(L);
title('Rotacion de 180°')

%% 9

imdata = imread('mri.jpg');
I = rgb2gray (imdata);
subplot(1,1,1)
imshow(I);

imwrite(I,'mri.tiff')

%% 10
im_dicom = dir('C:\Users\Julio Cesar\Desktop\PDI\P0\DICOM\*.dcm');
image = zeros(1,length(im_dicom));
pause on
for k = 1:length(im_dicom)
    image_name = im_dicom(k).name;
    info = dicominfo(strcat('C:\Users\Julio Cesar\Desktop\PDI\P0\DICOM\',image_name));
    pause(0.1)
    image_d = dicomread(info);
    figure(4); imshow(image_d,[])
    pause(0.1)
end

im_data = imread("pentagon256x256.tif");

subplot(1, 2, 1)
imshow(im_data);
title("Original Image")

matrix_2x2 = [0 0;0 0];
matrix_4x4 = [0 0 0 0;0 0 0 0;0 0 0 0;0 0 0 0];

Y = fft2(matrix_2x2,2^nextpow2(256), 2^nextpow2(256));   %Se supone que en la documentacion dice que esta cosa sirve para hacer padding con ceros de una transformacion

fft2_2x2 = Y (:, :, 1);

subplot(1, 2, 2)
imshow(abs(fftshift(Y)));
title("2x2")

im_data = imread("pentagon256x256.tif");

subplot(1, 2, 1)
imshow(im_data);
title("Original Image")

matrix_2x2 = [0 0;0 0];
matrix_4x4 = [0 0 0 0;0 0 0 0;0 0 0 0;0 0 0 0];

szImage = size(im_data);

B=zeros((2*szImage),szImage(2));
C=zeros((2*szImage(1)),(2*szImage(2)));

pos = 1;
c = 0;

for i=1:szImage(1)
    pos = i+c;
    B(pos, :) = image(i, :);
    c = c + (4-1);
end

szB = size(B);

for i=1:szB(2)
    pos = i+c;
    C(:, pos) = B(:, i);
    c = c+(4-1);
end


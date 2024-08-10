% Clear the workspace
clear;
clc;
close all;

% Load the image
img = imread("C:\Users\Sandushi\Documents\4th year\4th Year 1st Sem\Image Processing\Lenna_(test_image).png");

% Convert the image to grayscale
gray_img = rgb2gray(img);

% Apply histogram equalization
equalized_img = histeq(gray_img);

% Create subplots
figure;

% Original image
subplot(2, 2, 1);
imshow(gray_img);
title('Original Grayscale Image');

% Histogram of the original image
subplot(2, 2, 2);
imhist(gray_img);
title('Histogram of Original Image');

% Equalized image
subplot(2, 2, 3);
imshow(equalized_img);
title('Equalized Image');

% Histogram of the equalized image
subplot(2, 2, 4);
imhist(equalized_img);
title('Histogram of Equalized Image');

% Save the figure as a JPEG image
saveas(gcf, 'C:\Users\Sandushi\Documents\4th year\4th Year 1st Sem\Image Processing\Figure1.jpeg');

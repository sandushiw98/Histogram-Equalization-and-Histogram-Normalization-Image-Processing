% Clear the workspace
clear;
clc;
close all;

% Load the image
img = imread("C:\Users\Sandushi\Documents\4th year\4th Year 1st Sem\Image Processing\Lenna_(test_image).png");

% Convert the image to grayscale
gray_img = rgb2gray(img);

% Normalize the histogram
min_intensity = double(min(gray_img(:)));
max_intensity = double(max(gray_img(:)));
normalized_img = uint8(255 * (double(gray_img) - min_intensity) / (max_intensity - min_intensity));

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

% Normalized image
subplot(2, 2, 3);
imshow(normalized_img);
title('Normalized Image');

% Histogram of the normalized image
subplot(2, 2, 4);
imhist(normalized_img);
title('Histogram of Normalized Image');

% Save the figure as a JPEG image
saveas(gcf, "C:\Users\Sandushi\Documents\4th year\4th Year 1st Sem\Image Processing\Figure3.jpeg");

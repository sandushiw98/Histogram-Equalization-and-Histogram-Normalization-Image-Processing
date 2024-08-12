% Clear the workspace
clear;
clc;
close all;

% Load the image
img = imread("C:\Users\Sandushi\Documents\4th year\4th Year 1st Sem\Image Processing\Lenna_(test_image).png");

% Convert the image to grayscale
gray_img = rgb2gray(img);

% Define the number of rows and columns
[num_rows, num_cols] = size(gray_img);

% Calculate the total number of pixels
total_pixels = num_rows * num_cols;

% Initialize the final image and histogram vectors
equalized_img_custom = zeros(num_rows, num_cols);
pdf = zeros(256, 1);
cdf = zeros(256, 1);
histogram_original = zeros(256, 1);

% Calculate the histogram of the original image
for i = 1:num_rows
    for j = 1:num_cols
        intensity = gray_img(i, j);
        histogram_original(intensity + 1) = histogram_original(intensity + 1) + 1;
    end
end

% Calculate the PDF
pdf = histogram_original / total_pixels;

% Calculate the CDF
cdf(1) = pdf(1);
for k = 2:256
    cdf(k) = cdf(k - 1) + pdf(k);
end

% Normalize the CDF
cdf_normalized = cdf * 255;

% Apply the histogram equalization
for i = 1:num_rows
    for j = 1:num_cols
        equalized_img_custom(i, j) = cdf_normalized(gray_img(i, j) + 1);
    end
end

% Convert the equalized image to uint8
equalized_img_custom = uint8(equalized_img_custom);

% Apply histogram equalization using MATLAB built-in function
equalized_img_builtin = histeq(gray_img);

% Create subplots
figure;

% Original image
subplot(3, 2, 1);
imshow(gray_img);
title('Original Grayscale Image');

% Histogram of the original image
subplot(3, 2, 2);
imhist(gray_img);
title('Histogram of Original Image');

% Equalized image using customized code
subplot(3, 2, 3);
imshow(equalized_img_custom);
title('Equalized Image (Custom)');

% Histogram of the equalized image using customized code
subplot(3, 2, 4);
imhist(equalized_img_custom);
title('Histogram of Equalized Image (Custom)');

% Equalized image using MATLAB built-in function
subplot(3, 2, 5);
imshow(equalized_img_builtin);
title('Equalized Image (MATLAB Built-in)');

% Histogram of the equalized image using MATLAB built-in function
subplot(3, 2, 6);
imhist(equalized_img_builtin);
title('Histogram of Equalized Image (MATLAB Built-in)');

% Save the figure as a JPEG image
saveas(gcf, "C:\Users\Sandushi\Documents\4th year\4th Year 1st Sem\Image Processing\Figure2.jpeg");

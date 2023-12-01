close all;
clear;
clc;

% Load Fingerprint Image
[Image, ~] = uigetfile('*.pgm', 'Fingerprint');

% Call the compute_Core_Pointcare function to compute Pointcaré features
[xNuc, yNuc] = compute_Core_Pointcare(Image);

% Display the original fingerprint image and the Pointcaré feature
I = imread(Image);
figure;
subplot(1, 2, 1);
imshow(I);
title('Original Fingerprint Image');

subplot(1, 2, 2);
imshow(uint8(xNuc));
title('Pointcaré Feature (xNuc)');
colormap('jet'); % Apply a colormap for visualization
colorbar; % Show colorbar

close all;
clear;
clc;
NumPoints= 40;
N=15;
[Image,~]=uigetfile('*.pgm','Fingerprint');
%Section 3.0
    I=load_Image(Image);

% Section 3.1
% Angle Matrices Gx and Gy
    [GX,GY]=compute_Convolution(I);
    [DfilxyRatha,Gxx,Gyy,Gxy]=compute_Directional_Filtered_Ratha(GX, GY, N);
      
% Section 3.3
% Segmented Matrix
Sxy=compute_Segmentation_Angle(I,DfilxyRatha,31,25);

% Section 4.1
% Singularity Matrix
[Pxy, xP, yP]=compute_Singularity_PointCare(DfilxyRatha,Sxy,9);

% Compute Core Mean Minutiae
[xNUC, yNUC] = compute_Core_Mean_Minutiae(xP, yP, I);
Core=[xNUC,yNUC];

% Showing fingerprint core
imshow(Image);
hold on;
plot(Core(1),Core(2),'+','color',[1,0,0]);


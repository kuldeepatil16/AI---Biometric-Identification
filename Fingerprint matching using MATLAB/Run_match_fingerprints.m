clear;
clc; 
close all;
addpath(genpath(pwd));

[filename1,~]=uigetfile('*.tif','Fingerprint 1');
[filename2,~]=uigetfile('*.tif','Fingerprint 2');

flag =1; % Show images. 0 if don't show
Extract_Features(filename1,flag);
ff1=load(strcat(filename1(1:end-3),'txt'));
Extract_Features(filename2,flag);
ff2=load(strcat(filename2(1:end-3),'txt'));
[ff1_aligned,ff2_aligned,DeltaX,DeltaY,DeltaAngle] = Transform_fingerprints(ff1,ff2,flag);
Distance=Match_fingerprints_SOLUTION(ff1_aligned,ff2_aligned);


display(Distance,'Distance');
display(DeltaX,'DeltaX');
display(DeltaY,'DeltaY');
display(DeltaAngle,'DeltaAngle');


clc; clear; close all;

%% Data Import
rawImage = imread('Fluorescence_in_water.jpg');
[h, w, num] = size(rawImage);
imshow(rawImage);


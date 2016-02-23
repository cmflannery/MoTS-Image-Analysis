%% Preamble
clc; clear; close all;

%% Data Import
rawImage = imread('ImageTest_small.jpg');

[h, w, num] = size(rawImage);  % h = height, w = width, num = num colors/pixel(3)
colorCounter  = zeros(1,4); % [red, green, blue, gray]

global RED
global BLUE
global GREEN
RED = zeros(h,w,num);
BLUE = zeros(h,w,num);
GREEN = zeros(h,w,num);

for i=1:w
    for j=1:h % go down array first for speed
        %% initial values        
        redVal      = rawImage(j,i,1);
        greenVal    = rawImage(j,i,2);
        blueVal     = rawImage(j,i,3);
        
        %% functions
        color       = determineColor(redVal, greenVal, blueVal);
        if (color ~= 4)
            buildNewArrays(color, RED, GREEN, BLUE, j, i);
        end
        colorCounter(1, color) = colorCounter(1, color) + 1;
    end
end
imwrite(RED,    'RedOnly.jpg')
imwrite(GREEN,  'GreenOnly.jpg')
imwrite(BLUE,   'BlueOnly.jpg')
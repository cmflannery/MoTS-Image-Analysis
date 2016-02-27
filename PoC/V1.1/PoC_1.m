%% Preamble
clc; clear; close all;

%% Data Import
rawImage = imread('DyeInWater.jpg');
[h, w, num] = size(rawImage);  % h = height, w = width, num = num colors/pixel(3)

%% Initial Values
IDEAL = [0 137 255]; % Perfect mixture value
pixelVal = zeros(1,num);

global NEWIMAGE;
NEWIMAGE = uint8(zeros(h,w,num));
colorCounter = 0;


%% Start Analysis
for j=1:w
    for i=1:h % go down array first for speed
        %% initial values        
        pixelVal(1)      = rawImage(i,j,1);
        pixelVal(2)      = rawImage(i,j,2);
        pixelVal(3)      = rawImage(i,j,3);
        
        %% functions
        if (getColor(pixelVal, IDEAL))
            colorCounter = colorCounter + 1;
            buildColor(i,j,pixelVal,NEWIMAGE);
        end
    end
end
imwrite(NEWIMAGE, 'Dye_newimage.jpg');
imshow(NEWIMAGE);

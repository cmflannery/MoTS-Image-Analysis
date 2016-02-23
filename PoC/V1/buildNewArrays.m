function a = buildNewArrays(color, RED, GREEN, BLUE, h, w)
%BUILDNEWARRAYS     BUILD NEW ARRAYS
%       Creates fully saturated pixels in corresponding colors in each new
%       color array
% 
%       Generally,
%           buildNewArrays(color, Red, Green, Blue, h, w)
%   
%           h = height
%           w = width

%% get global vars
global RED
global BLUE
global GREEN
%% error checking
if (color ~= 1) && (color ~= 2) && (color ~= 3)
    error('Color must be either Red, Green, or Blue (1, 2, or 3)')
end
%% begin buildNewArrays
if color == 1
    RED(h,w,1) = 255;
elseif color == 2
    GREEN(h,w,2) = 255;
elseif color == 3
    BLUE(h,w,3) = 255;
end

a = 0;
return

function value = getColor(actual,ideal)
%GETCOLOR   get Color
%       compares the actual to the ideal value of the pixel
%       compensates for brightness, pixel must have minimum intensity of
%       10 percent for EITHER R,G, or B
%
%
%       Generally,
%
%           getColor(actual,ideal)
%               
%           function takes two 1x3 arrays
%
%      Only analyzes 8bit RGB pixels
%
%      returns true if color is a match and false if color is not a match

%% Declare variables
r = actual(1);
g = actual(2);
b = actual(3);

R = ideal(1);
G = ideal(2);
B = ideal(3);

mod_val = uint8(zeros(1,3));

sigma = 25; % allowable std deviation
%% Error Checking
if (r < 0) || (g < 0) || (b < 0) || ...         % check actual values
        (R < 0) || (G < 0) || (B < 0)           % check ideal values
    error('Error 1, Pixel values can not be negative')
elseif (r > 255) || (g > 255) || (b > 255) || ...   % actual
        (R > 255) || (G > 255) || (B > 255)         % ideal
    error('Error 2, Pixel values can not be greater than 255')
end
%% Begin getColor()
% check 1
if getDeviation(actual, ideal, sigma)
    value = true;
    return;
else
    value = false;
    % continue to next check
end

% check 2
for n=1:10
    shade_darker   = 1/n * actual;
    shade_brighter  = n * actual;
    
    if shade_darker(1) > 255
        shade_darker(1) = 255;
    end
    if shade_darker(2) > 255
        shade_darker(2) = 255;
    end
    if shade_darker(3) > 255
        shade_darker(3) = 255;
    end
    if shade_brighter(1) > 255
        shade_brighter(1) = 255;
    end
    if shade_brighter(2) > 255
        shade_brighter(2) = 255;
    end
    if shade_brighter(3) > 255
        shade_brighter(3) = 255;
    end
    
    if getDeviation(shade_darker,ideal,sigma) ||...
            getDeviation(shade_brighter,ideal,sigma)
        value = true;
        return
    else
        value = false;
    end
end
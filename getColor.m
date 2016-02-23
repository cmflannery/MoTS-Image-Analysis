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

%% create variables
r = actual(1);
g = actual(2);
b = actual(3);

R = ideal(1);
G = ideal(2);
B = ideal(3);
%% Error Checking
if (r < 0) || (g < 0) || (b < 0) || ...         % check actual values
        (R < 0) || (G < 0) || (B < 0)           % check ideal values
    error('Error 1, Pixel values can not be negative')
elseif (r > 255) || (g > 255) || (b > 255) || ...   % actual
        (R > 255) || (G > 255) || (B > 255)         % ideal
    error('Error 2, Pixel values can not be greater than 255')
end
%% Begin getColor()

sigma = 25; % allowable std deviation

dr = abs(r - R);
dg = abs(g - G);
db = abs(b - B);

if (dr <= sigma) && (dg <= sigma) && (db <= sigma)
    value = true;
    return
else
    value = false;
    return
end
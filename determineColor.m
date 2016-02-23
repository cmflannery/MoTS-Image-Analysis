function color = determineColor(r, g, b)
%DETERMINE COLOR
%       Determines color value of the pixel based on the rgb values
%       Colors only analyzed for highest red green and blue content
%       Returns 1 2 3 corresponding to Red Green and Blue respectively
%       Returns 4 for all shades of gray(including Black and White)
%
%       Note: determineColor takes 8-bit RGB values only
% 
%       Generally,
%       color = determineColor(r, g, b)
%       color = 1x1
%       r = 1x1 -- red value
%       g = 1x1 -- green value
%       b = 1x1 -- blue value

% if (r <= 15) && (g <= 15) && (b <= 15)
%     color = 4; % Black
%     return
% elseif (r >= 240) && (g >= 240) && (b >= 240)
%     color = 4;
%     return % White
% end

%% Error Checking
if (r < 0) || (g < 0) || (b < 0)
    error('Error 1, Pixel values can not be negative')
elseif (r > 255) || (g > 255) || (b > 255)
    error('Error 2, Pixel values can not be greater than 255')
end
%% Start Determine Color

% Kill small values
if (r < 50)
    r = 0;
end
if (g < 50)
    g = 0;
end
if (b < 50)
    b = 0;
end

% determine color
if (r > b) && (r > g)       % Red
    color = 1;
    return
elseif (g > r) && (g > b)   % Blue
    color = 2;
    return
elseif (b > r) && (b > g)   % Green
    color = 3;
    return
else
    color = 4;              % Gray
    return
end
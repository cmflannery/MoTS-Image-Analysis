function goodPixel = getDeviation(actual, ideal, sigma)
%GETDEVIATION   getDeviation
%
%       Simple function to caluclate the deviation of a pixel from the
%       ideal pixel value\
%
%       Generally,
%
%           getDeviation(actual, ideal, sigma)
%
%
%% Declare Vars
r = actual(1);
g = actual(2);
b = actual(3);

R = ideal(1);
G = ideal(2);
B = ideal(3);
%% Error Checking

%% Start getDeviation()
dr = abs(r - R);
dg = abs(g - G);
db = abs(b - B);

% check 1
if (dr <= sigma) && (dg <= sigma) && (db <= sigma)
    goodPixel = true;
    return
else
    goodPixel = false;
    return
end
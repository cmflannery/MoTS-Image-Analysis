function a = buildColor(i,j,val, NEWIMAGE);
%BUILDCOLOR     buildColor
%       adds actual color that is passes getColor to new Array
%       creates new image with only color visible
%       default array is black
%
%       Generally,
%
%           buildColor(i,j,val,NEWIMAGE)
%           i = row, j = column
%           val = 1x3 array (r,g,b values)
%           NEWIMAGE = global ptr to new array

%% Declare Vars
global NEWIMAGE;
%% Error Checking
if (size(val) ~= [1 3])
    error('Error buildColor 1: val must be a 1x3 array of rgb values');
end
%% Start buildColor()

NEWIMAGE(i,j,:) = val;

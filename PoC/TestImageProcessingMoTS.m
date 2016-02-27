%% Test Image Processing
% Nick Garrett
% 2/13/16

clc, clear

% Use matlab to process an image

%file = 'RocketIcon.png';
file = 'WaterColor.jpg';

color = imread(file);
color = mat2gray(color);
figure(1)
image(color)
title('Original Image')

% Color Matrices
R = color(:,:,1);
G = color(:,:,2);
B = color(:,:,3);

% See what happens if we take out all of the blue color. 
test = zeros(size(color));
test(:,:,1) = R;
test(:,:,2) = G;
test(:,:,3) = B;
%image(test);

%% Try color separation method that I don't totally understand...
%{
cform = makecform('srgb2lab');
lab_color = applycform(color,cform);

ab = double(lab_color(:,:,2:3));
nrows = size(ab,1);
ncols = size(ab,2);
ab = reshape(ab,nrows*ncols,2);

nColors = 3;
% repeat the clustering 3 times to avoid local minima
[cluster_idx, cluster_center] = kmeans(ab,nColors,'distance','sqEuclidean', ...
                                      'Replicates',3);

pixel_labels = reshape(cluster_idx,nrows,ncols);
imshow(pixel_labels,[]), title('image labeled by cluster index');

segmented_images = cell(1,3);
rgb_label = repmat(pixel_labels,[1 1 3]);

for k = 1:nColors
    colors = color;
    colors(rgb_label ~= k) = 0;
    segmented_images{k} = colors;
end

figure(2)
imshow(segmented_images{1}), title('objects in cluster 1');

figure(3)
imshow(segmented_images{2}), title('objects in cluster 2');

figure(4)
imshow(segmented_images{3}), title('objects in cluster 3');
%}
%% Option 2
% If there isn't enough red, make the photo black at that point...
% Boundaries ... Perfect Yellow
lowerR = 0.7; % 1
lowerB = 0.5; % 0.902
lowerG = 0.01; % 0
stdLimit = 0.2; 
for i = 1:size(color,1)
    for j = 1:size(color,2)
        
        %if (test(i,j,1) < lowerR || test(i,j,2) < lowerB) || test(i,j,2) < lowerG 
        if std(color(i,j,:)) < stdLimit
            test(i,j,:) = 0;
        end
    end
end

% Create a new plot
figure(5)
image(test)
title('Filtered Image')

% Create Difference Plot
figure(6)
image(color-test)
title('Differnces Between')



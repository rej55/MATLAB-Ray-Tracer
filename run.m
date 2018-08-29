%% Initialize
clear
clf

%% Set # of pixels
px = [300 600];

%% Set points
upper_left = [-2.0, 1.0, -1.0]';
horizontal = [4.0, 0.0, 0.0]';
vertical = [0.0 -2.0 0.0]';
origin = [0.0 0.0 0.0]';

ix = 0:px(2)-1;
iy = 0:px(1)-1;
[u, v] = meshgrid(ix./px(2), iy./px(1));

u = num2cell(u);
v = num2cell(v);

%% Define hitable objects
hitable(1) = sphere([0;0;-1], 0.5);
hitable(2) = sphere([0;-100.5;-1], 100);

%% Generate rays
directions = cellfun(@(x, y) upper_left + horizontal*x + vertical*y, u, v, 'UniformOutput', false);
Ray = cellfun(@(x) ray(origin, x), directions, 'UniformOutput', false);

%% Generate image
Image = Ray2Image(Ray, hitable);
Image = imfilter(Image, ones(3,3)./9);

%% Show image
imshow(Image);
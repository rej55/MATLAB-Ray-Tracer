%% Initialize
clear
clf

%% Define hitable objects
hitable(1) = sphere([0;0;-1], 0.5);
hitable(2) = sphere([0;-100.5;-1], 100);

%% Set # of pixels
px = [100 200];

%% Generate camera
cam = camera;

%%
ix = 0:px(2)-1;
iy = 0:px(1)-1;
ns = 10;

Image = zeros(px(1), px(2), 3);
for s = 1:ns
    tic;
    [u, v] = meshgrid((ix + rand(size(ix)))./px(2), (iy + rand(size(iy)))./px(1));
    du = u;
    dv = v;
    
    %% Generate image
    Image_tmp = Ray2Image(du, dv, cam, hitable);
    Image = Image + Image_tmp./ns;
    t = toc;
    disp([num2str(s) '/' num2str(ns) ': t = ' num2str(t) ' sec.']);
end

%% Show image
imshow(sqrt(Image));
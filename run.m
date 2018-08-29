%% Initialize
clear
clf

%% Define hitable objects
hitable(1) = sphere([0;0;-1], 0.5, lambertian([0.8;0.3;0.3]));
hitable(2) = sphere([0;-100.5;-1], 100, lambertian([0.8;0.8;0.0]));
hitable(3) = sphere([1;0;-1], 0.5, metal([0.8;0.6;0.2], 0.3));
hitable(4) = sphere([-1;0;-1], 0.5, dielectric(1.5));
hitable(5) = sphere([-1;0;-1], -0.45, dielectric(1.5));

%% Set # of pixels
px = [100 200];

%% Generate camera
cam = camera;

%%
ix = 0:px(2)-1;
iy = 0:px(1)-1;
ns = 100;

Image = zeros(px(1), px(2), 3);
Image_tmp = cell(ns, 1);
tic;
parfor s = 1:ns
    [u, v] = meshgrid((ix + rand(size(ix)))./px(2), (iy + rand(size(iy)))./px(1));
    du = u;
    dv = v;
    
    %% Generate image
    Image_tmp{s} = Ray2Image(du, dv, cam, hitable, 0.0);
    disp([num2str(s) '/' num2str(ns)]);
end

for s = 1:ns
    Image = Image + Image_tmp{s}./ns;
end
t = toc;
%% Show image
imshow(sqrt(Image));
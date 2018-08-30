%% Initialize
clear
clf

%% Define hitable objects
hitable = make_scene;

%% Set # of pixels
px = 10*[40 70];

%% Generate camera
lookfrom = [11;1.5;4];
lookat = [0;1;0];
dist_focus = norm(lookfrom-lookat);
aperture = 0.2;
cam = camera(lookfrom, lookat, [0; 1; 0], 21, px(2)/px(1), aperture, dist_focus);

%% Set grid
ix = 0:px(2)-1;
iy = 0:px(1)-1;
[u, v] = meshgrid(ix, iy);


%% Generate image
ns = 6;
nss = 100;
Image = zeros(px(1), px(2), 3);
Image_tmp = zeros(px(1), px(2), 3, ns);
for ss = 1:nss
    tic
    parfor s = 1:ns
        % Generate random number from halton sequense
        hs = haltonset(px(2), 'Skip', abs(randi(500)), 'Leap', abs(randi(500)));
        hs = scramble(hs, 'RR2');
        % Generate image
        Image_tmp(:, :, :, s) = Ray2Image((u+hs(1:px(1), :))./px(2), (v+hs(px(1)+1:2*px(1), :))./px(1), cam, hitable, 0.0);
    end
    t = toc;
    Image = Image + mean(Image_tmp, 4);
    disp([num2str(ss) '/' num2str(nss) ': t = ' num2str(t) ' sec.']);
    % Show image
    imshow(sqrt(Image./(ss)));
    drawnow;
end

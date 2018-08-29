function Image = Ray2Image(u, v, cam, hitable)
    % Coloring
    function [R, G, B] = get_color(x, y)
        Ray = cam.get_ray(x, y);
        [R, G, B] = Ray.coloring(hitable);
    end
    [R, G, B] = arrayfun(@get_color, u, v);
    % Transform to image data
    [ly, lx] = size(u);
    Image = zeros(ly, lx, 3);
    Image(:, :, 1) = R;
    Image(:, :, 2) = G;
    Image(:, :, 3) = B;
end


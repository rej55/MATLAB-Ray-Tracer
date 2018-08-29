function Image = Ray2Image(Ray, hitable)
    % Coloring
    RGB = cellfun(@(R) R.coloring(hitable), Ray, 'UniformOutput', false);
    % Transform to image data
    [ly, lx] = size(RGB);
    RGBMat = cell2mat(RGB);
    RGBMat = reshape(RGBMat(:), [3 ly*lx])';
    Image = reshape(RGBMat, [ly lx 3]);
end
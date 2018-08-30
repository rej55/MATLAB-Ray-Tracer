function hitable = make_scene
    hitable(1) = sphere([0;-1000;0], 1000, lambertian([0;0.3;0]));
    hitable(2) = sphere([3; 0.5; 2], 0.5, lambertian([1;0.1;0.1]));
    hitable(3) = sphere([-2; 0.7; 2.5], 0.7, lambertian([1;0.5;0.1]));
    hitable(4) = sphere([3.5; 0.3; 3], 0.3, lambertian([0.1;0.7;0.9]));
    hitable(5) = sphere([0; 1; 0], 1.0, dielectric(1.5));
    hitable(6) = sphere([-4; 1; 0], 1.0, lambertian([0.1; 0.1; 0.7]));
    hitable(7) = sphere([4; 1; 0], 1.0, metal([0.6; 0.6; 0.7], 0.0)); 
end
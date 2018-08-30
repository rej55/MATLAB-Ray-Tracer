classdef camera
    properties
        origin;
        upper_left;
        horizontal; % right direction
        vertical; % lower direction
        u;
        v;
        w;
        lens_radius;
    end
    
    methods
        %% Constructor
        function obj = camera(lookfrom, lookat, vup, vfov, aspect, aperture, focus_dist)
            obj.lens_radius = aperture/2;
            theta = vfov*pi/180;
            half_height = tan(theta/2);
            half_width = aspect * half_height;
            obj.origin = lookfrom;
            obj.w = lookfrom - lookat;
            obj.w = obj.w./norm(obj.w);
            obj.u = cross(vup, obj.w);
            obj.u = obj.u./norm(obj.u);
            obj.v = cross(obj.w, obj.u);
            obj.upper_left = obj.origin - half_width*focus_dist*obj.u + half_height*focus_dist*obj.v - focus_dist*obj.w;
            obj.horizontal = 2*half_width*focus_dist*obj.u;
            obj.vertical = -2*half_height*focus_dist*obj.v; 
        end
        
        %% Generate rays
        function rayobj = get_ray(obj, x, y)
            
            rd = obj.lens_radius*random_in_unit_disk;
            offset = obj.u * rd(1) + obj.v * rd(2);
            dir = obj.upper_left + obj.horizontal*x + obj.vertical*y - obj.origin - offset;
            rayobj = ray(obj.origin + offset, dir);
        end
        
    end
end
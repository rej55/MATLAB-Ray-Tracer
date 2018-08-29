classdef camera
    properties
        origin;
        upper_left;
        horizontal; % right direction
        vertical; % lower direction
    end
    
    methods
        function obj = camera(lookfrom, lookat, vup, vfov, aspect)
            theta = vfov*pi/180;
            half_height = tan(theta/2);
            half_width = aspect * half_height;
            obj.origin = lookfrom;
            w = lookfrom - lookat;
            w = w./norm(w);
            u = cross(vup, w);
            u = u./norm(u);
            v = cross(w, u);
            %obj.upper_left = [-half_width, half_height, -1.0]';
            obj.upper_left = obj.origin - half_width*u + half_height*v - w;
            obj.horizontal = 2*half_width*u;
            obj.vertical = -2*half_height*v; 
        end
        
        function rayobj = get_ray(obj, u, v)
            %% Generate rays
            dir = obj.upper_left + obj.horizontal*u + obj.vertical*v - obj.origin;
            rayobj = ray(obj.origin, dir);
        end
    end
end
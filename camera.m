classdef camera
    properties
        origin;
        upper_left;
        horizontal; % right direction
        vertical; % lower direction
    end
    
    methods
        function obj = camera()
            obj.origin = [0.0 0.0 0.0]';
            obj.upper_left = [-2.0, 1.0, -1.0]';
            obj.horizontal = [4.0, 0.0, 0.0]';
            obj.vertical = [0.0 -2.0 0.0]'; 
        end
        
        function rayobj = get_ray(obj, u, v)
            %% Generate rays
            dir = obj.upper_left + obj.horizontal*u + obj.vertical*v;
            rayobj = ray(obj.origin, dir);
        end
    end
end
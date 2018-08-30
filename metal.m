classdef metal
    properties
        albedo;
        fuzz;
    end
    
    methods
        %% Constructor
        function obj = metal(a, f)
            obj.albedo = a;
            obj.fuzz = min(f, 1);
        end
        
        %% Calculate scatter of the ray
        function [flag, attenuation, scattered] = scatter(obj, ray_in, rec)
            r = reflect(ray_in.direction./norm(ray_in.direction), rec.normal);
            scattered = ray(rec.p, r + obj.fuzz*random_in_unit_sphere);
            attenuation = obj.albedo;
            flag = (scattered.direction' * rec.normal) > 0;
        end
        
    end
end
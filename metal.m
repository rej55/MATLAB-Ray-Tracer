classdef metal
    properties
        albedo;
        fuzz = 1;
    end
    
    methods
        function obj = metal(a, f)
            obj.albedo = a;
            obj.fuzz = min(f, 1);
        end
        
        function [flag, attenuation, scattered] = scatter(obj, ray_in, rec)
            r = reflect(ray_in.direction./norm(ray_in.direction), rec.normal);
            scattered = ray(rec.p, r + obj.fuzz*random_in_unit_sphere);
            attenuation = obj.albedo;
            flag = (scattered.direction' * rec.normal) > 0;
        end
        
        
    end
end
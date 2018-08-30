classdef lambertian
    properties
        albedo;
    end
    
    methods
        %% Constructor
        function obj = lambertian(a)
            obj.albedo = a;
        end
        
        %% Calculate scatter of the ray
        function [flag, attenuation, scattered] = scatter(obj, ray_in, rec)
            target = rec.p + rec.normal + random_in_unit_sphere;
            scattered = ray(rec.p, target - rec.p);
            attenuation = obj.albedo;
            flag = true;
        end
        
    end
end
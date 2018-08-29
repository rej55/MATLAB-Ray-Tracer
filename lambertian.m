classdef lambertian
    properties
        albedo;
    end
    
    methods
        function obj = lambertian(a)
            obj.albedo = a;
        end
        
        function [flag, attenuation, scattered] = scatter(obj, ray_in, rec)
            target = rec.p + rec.normal + random_in_unit_sphere;
            scattered = ray(rec.p, target - rec.p);
            attenuation = obj.albedo;
            flag = true;
        end
        
    end
end
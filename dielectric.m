classdef dielectric
    properties
        ref_idx;
    end
    
    methods
        function obj = dielectric(ri)
            obj.ref_idx = ri;
        end
        
        function [flag, attenuation, scattered] = scatter(obj, ray_in, rec)
            reflected = reflect(ray_in.direction./norm(ray_in.direction), rec.normal);
            attenuation = ones(3, 1);
            if(ray_in.direction'*rec.normal > 0)
                outward_normal = -rec.normal;
                ni_over_nt = obj.ref_idx;
                cosine = obj.ref_idx * (ray_in.direction'*rec.normal) / norm(ray_in.direction);
            else
                outward_normal = rec.normal;
                ni_over_nt = 1./obj.ref_idx;
                cosine = -(ray_in.direction'*rec.normal) / norm(ray_in.direction);
            end
            [flag_ref, refracted] = refract(ray_in.direction, outward_normal, ni_over_nt);
            if(flag_ref)
                reflect_prob = schlick(cosine, obj.ref_idx); 
            else
                reflect_prob = 1;
            end
            if(rand(1) < reflect_prob)
                scattered = ray(rec.p, reflected);
            else
                scattered = ray(rec.p, refracted);
            end
            flag = true;
        end
        

    end
end
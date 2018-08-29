classdef ray
    
    properties
        origin;
        direction;
    end
    
    methods
        function obj = ray(A, B)
            obj.origin = A;
            obj.direction = B;
        end
        
        function p = point_at(obj, t)
            p = obj.origin + t*obj.direction;
        end
        
        function [r, g, b] = coloring(obj, hitable)
            [flag, rec] = hit_anything(obj, hitable, 0.0001, 10^5);
            if(flag)
                target = rec.p + rec.normal + random_in_unit_sphere;
                [r, g, b] = coloring(ray(rec.p, target-rec.p), hitable);
                r = 0.5*r;
                g = 0.5*g;
                b = 0.5*b;
            else
                u = obj.direction./norm(obj.direction);
                k = 0.5*(u(2) + 1.0);
                c = (1.0 - k)*[1.0;1.0;1.0] + k*[0.5;0.7;1.0];
                r = c(1);
                g = c(2);
                b = c(3);
            end
        end
        
        function [flag, rec] = hit_anything(obj, hitable, tmin, tmax)
            rec = [];
            flag = false;
            closest_so_far = tmax;
            for i = 1:length(hitable)
                [hit_flag, rec_tmp] = hitable(i).hit(obj, tmin, closest_so_far);
                if(hit_flag)
                    flag = true;
                    closest_so_far = rec_tmp.t;
                    rec = rec_tmp;
                end
            end
        end
        
    end
end


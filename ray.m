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
        
        function c = coloring(obj, hitable)
            [flag, rec] = hit_anything(obj, hitable, 0.0, 10^5);
            if(flag)
                N = rec.normal;
                c = 0.5*(N+1);
            else
                u = obj.direction./norm(obj.direction);
                k = 0.5*(u(2) + 1.0);
                c = (1.0 - k)*[1.0;1.0;1.0] + k*[0.5;0.7;1.0];
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


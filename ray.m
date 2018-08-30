classdef ray
    
    properties
        origin;
        direction;
    end
    
    methods
        %% Constructor
        function obj = ray(A, B)
            obj.origin = A;
            obj.direction = B;
        end
        
        %% Calculate point of the ray
        function p = point_at(obj, t)
            p = obj.origin + t*obj.direction;
        end
        
        %% Calculate color
        function [r, g, b] = coloring(obj, hitable, depth)
            [flag, rec] = hit_anything(obj, hitable, 0.000001, 10^8);
            if(flag)
                [flag_rec, attenuation, sc] = rec.material.scatter(obj, rec);
                if(depth < 50 & flag_rec)
                    [R, G, B] = coloring(sc, hitable, depth+1);
                    r = attenuation(1)*R;
                    g = attenuation(2)*G;
                    b = attenuation(3)*B;
                else
                    r = 0;
                    g = 0;
                    b = 0;
                end
                
            else
                u = obj.direction./norm(obj.direction);
                k = 0.5*(u(2) + 1.0);
                c = (1.0 - k)*[1.0;1.0;1.0] + k*[0.5;0.7;1.0];
                r = c(1);
                g = c(2);
                b = c(3);
            end
        end
        
        %% Calculate collision of ray and hitable objects
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


classdef sphere
    
    properties
        center;
        radius;
    end
    
    methods
        % Constructor
        function obj = sphere(c, r)
            obj.center = c;
            obj.radius = r;
        end
        
        % Hit ditection
        function [flag, rec] = hit(obj, ray, tmin, tmax)
            rec = [];
            oc = ray.origin - obj.center;
            a = ray.direction'*ray.direction;
            b = 2.0 * oc' * ray.direction;
            c = oc' * oc - obj.radius * obj.radius;
            discriminant = b*b - 4*a*c;
            flag = false;
            if(discriminant > 0)
                t = (-b - sqrt(discriminant))/(2.0*a);
                if(t < tmax & t > tmin)
                    rec = hitable(t, ray.point_at(t), (ray.point_at(t) - obj.center)./obj.radius);
                    flag = true;
                else
                    t = (-b + sqrt(discriminant))/(2.0*a);
                    if(t < tmax & t > tmin)
                        rec = hitable(t, ray.point_at(t), (ray.point_at(t) - obj.center)./obj.radius);
                        flag = true;
                    end
                end
            end
        end
        
    end
end


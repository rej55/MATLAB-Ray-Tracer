classdef sphere
    
    properties
        center;
        radius;
        material;
    end
    
    methods
        % Constructor
        function obj = sphere(c, r, material)
            obj.center = c;
            obj.radius = r;
            obj.material = material;
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
                    rec = hitable(t, ray.point_at(t), (ray.point_at(t) - obj.center)./obj.radius, obj.material);
                    flag = true;
                else
                    t = (-b + sqrt(discriminant))/(2.0*a);
                    if(t < tmax & t > tmin)
                        rec = hitable(t, ray.point_at(t), (ray.point_at(t) - obj.center)./obj.radius, obj.material);
                        flag = true;
                    end
                end
            end
        end
        
    end
end


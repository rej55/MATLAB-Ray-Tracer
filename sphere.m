classdef sphere
    
    properties
        center;
        radius;
        material;
    end
    
    methods
        %% Constructor
        function obj = sphere(c, r, material)
            obj.center = c;
            obj.radius = r;
            obj.material = material;
        end
        
        %% Hit ditection
        function [flag, rec] = hit(obj, ray, tmin, tmax)
            rec = [];
            oc = ray.origin - obj.center;
            a = ray.direction'*ray.direction;
            b = oc' * ray.direction;
            c = oc' * oc - obj.radius * obj.radius;
            discriminant = b*b - a*c;
            flag = false;
            if(discriminant > 0)
                t = (-b - sqrt(discriminant))/(a);
                if(t < tmax & t > tmin)
                    rec = hitable(t, ray.point_at(t), (ray.point_at(t) - obj.center)./norm(ray.point_at(t) - obj.center), obj.material);
                    flag = true;
                else
                    t = (-b + sqrt(discriminant))/(a);
                    if(t < tmax & t > tmin)
                        rec = hitable(t, ray.point_at(t), (ray.point_at(t) - obj.center)./norm(ray.point_at(t) - obj.center), obj.material);
                        flag = true;
                    end
                end
            end
        end
        
    end
end


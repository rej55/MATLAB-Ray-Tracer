classdef hitable
    
    properties
        t;
        p;
        normal;
        material;
    end
    
    methods
        function obj = hitable(t, p, normal, material)
            obj.t = t;
            obj.p = p;
            obj.normal = normal;
            obj.material = material;
        end
    end
end


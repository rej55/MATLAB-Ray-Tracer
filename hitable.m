classdef hitable
    
    properties
        t;
        p;
        normal;
    end
    
    methods
        function obj = hitable(t, p, normal)
            obj.t = t;
            obj.p = p;
            obj.normal = normal;
        end
    end
end


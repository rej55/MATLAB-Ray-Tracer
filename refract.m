function [flag, refracted] = refract(v, n, ni_over_nt)
    uv = v./norm(v);
    dt = uv'*n;
    discriminant = 1.0 - ni_over_nt^2 * (1 - dt^2);
    refracted = [];
    if(discriminant>0)
        refracted = ni_over_nt*(uv - n*dt) - n*sqrt(discriminant);
        flag = true;
    else
        flag = false;
    end
end
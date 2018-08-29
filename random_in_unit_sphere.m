function p = random_in_unit_sphere
    p = 2*ones(3, 1);
    while((norm(p)^2)>=1)
        p = 2*rand(3, 1) - ones(3, 1);
    end
end
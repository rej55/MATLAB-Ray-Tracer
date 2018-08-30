function p = random_in_unit_disk()
p = 2*ones(3, 1);
while(p'*p > 1.0)
    p = randn(3, 1);
    p(3) = 0;
end
end
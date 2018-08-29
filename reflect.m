function r = reflect(v, n)
    r = v - 2*(v'*n)*n;
end
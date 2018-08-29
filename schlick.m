function s = schlick(cosine, ref_idx)
    r0 = (1-ref_idx)/(1+ref_idx);
    s = r0^2 + (1-r0^2)*(1-cosine)^5;
end
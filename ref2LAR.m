function LAR = ref2LAR(ref_coef)
LAR = nan(size(ref_coef));

for i=1:length(ref_coef)
    if abs(ref_coef(i)) < 0.675
        LAR(i) = ref_coef(i);
    elseif abs(ref_coef(i)) >= 0.675 && abs(ref_coef(i)) < 0.950
        LAR(i) = sign(r(i))*(2*abs(r(i)) - 0.675);
    else
        LAR(i) = sign(r(i))*(8*abs(r(i)) - 6.375);
    end    
end

end
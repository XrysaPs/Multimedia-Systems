function LAR = ref2LAR(ref_coef)
LAR = nan(size(ref_coef));

for i=1:length(LAR)
    if abs(ref_coef(i)) < 0.675
        LAR(i) = ref_coef(i);
    elseif abs(ref_coef(i)) >= 0.675 && abs(ref_coef(i)) < 0.950
        LAR(i) = sign(ref_coef(i))*(2*abs(ref_coef(i)) - 0.675);
    else
        LAR(i) = sign(ref_coef(i))*(8*abs(ref_coef(i)) - 6.375);
    end    
end

end
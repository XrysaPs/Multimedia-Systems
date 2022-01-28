function ref = LAR2ref(LAR)
ref = nan(size(LAR));

for i=1:length(ref)
    if abs(LAR(i)) < 0.675
        ref(i) = LAR(i);
    elseif abs(LAR(i)) >= 0.675 && abs(LAR(i)) < 1.225
        ref(i) = sign(LAR(i)) * (0.5*abs(LAR(i)) + 0.3375);
    else
        ref(i) = sign(LAR(i)) * (0.125*abs(LAR(i)) + 0.796875);
    end
end

end
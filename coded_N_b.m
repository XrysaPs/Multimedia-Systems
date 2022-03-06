function [b_coded] = coded_N_b(b)

DLB = [0.2 0.5 0.8];

if b <= DLB(1)
    c = 0;
elseif (b >= DLB(1) && b <= DLB(2))
    c = 1;
elseif (b >= DLB(2) && b <= DLB(3))
    c = 2;
elseif b >= DLB(3)
    c = 3;
end

b_coded = c;

end

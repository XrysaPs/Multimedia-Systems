function [N_coded,b_coded] = coded_N_b(N,b)

%N_coded=dec2bin(N,7);

DLB = [0.2 0.5 0.8];
QLB = [0.1 0.35 0.65 1];

if b<=DLB(1)
    c=0;
elseif b>=DLB(1) && b<=DLB(2)
    c=1;
elseif b>=DLB(2) && b<=DLB(3)
    c=2;
elseif b>=DLB(3)
    c=3;
end

b_coded = QLB(c+1);

end


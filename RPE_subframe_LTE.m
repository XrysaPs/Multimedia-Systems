function [N,b] = RPE_subframe_LTE(d, Prevd)

correlation_0 = -Inf;
N = 0;

for lamda=40:120
    y = Prevd(3*40+1-lamda:3*40+40-lamda);
    cor = xcorr(d,y);    
    correlation = sum(cor);
    if correlation > correlation_0
        correlation_0 = correlation;
        N = lamda;
    end
end

y = Prevd(3*40+1-N : 3*40+40-N);
b = sum(d.*y) ./ sum(y.^2);

end
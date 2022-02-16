function N = pitch_N(s,j)

correlation_0=-Inf;
N=0;
for lamda=40:1:j*40
%     lamda
%     j
    x = s(j*40+1:j*40+40);
    y = s(j*40+1-lamda:j*40+40-lamda);
    cor = xcorr(x,y);
    
    correlation = max(cor);
    if correlation>correlation_0
        correlation_0=correlation;
        N=lamda;
    end
end

end

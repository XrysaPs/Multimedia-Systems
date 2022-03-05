function [N,b] = RPE_subframe_LTE(d, Prevd)


correlation_0 = -Inf;
N = 0;

% concatenated_frames = [Prevd; d];
j=3;

for lamda=40:120
%     y = concatenated_frames(j*40+1-lamda:j*40+40-lamda)
    y = Prevd(j*40+1-lamda:j*40+40-lamda);
    cor = xcorr(d,y);
    
    
    correlation = sum(cor);
    if correlation > correlation_0
        correlation_0 = correlation;
        N = lamda;
    end
end

% y = concatenated_frames(j*40+1-N : j*40+40-N)
y = Prevd(j*40+1-N : j*40+40-N)

b = sum(d.*y) ./ sum(y.^2);


end
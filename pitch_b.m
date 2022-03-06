function [N, b_coded] = pitch_b(frame,j,previous_frame)

correlation_0 = -Inf;
N = 0;
x = frame(j*40+1:j*40+40);

concatenated_frames = [previous_frame; frame];
j=j+4;

for lamda=40:120
    y = concatenated_frames(j*40+1-lamda:j*40+40-lamda);
    cor = xcorr(x,y);
    
    
    correlation = sum(cor);
    if correlation > correlation_0
        correlation_0 = correlation;
        N = lamda;
    end
end

y = concatenated_frames(j*40+1-N : j*40+40-N);

b = sum(x.*y) ./ sum(y.^2);

b_coded= coded_N_b(b);

end
function w = predictor_weights(s, predictor_order)

acf = xcorr(s);
[~,i_max] = max(acf);
r = acf(1+i_max:i_max + predictor_order);
R = toeplitz(r,r);
w = R\r; % -> Identicall to inv(R)*r
end
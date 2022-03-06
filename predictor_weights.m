function w = predictor_weights(s)

acf = autocorrelation(s);
r=acf(2:end);
R = toeplitz(acf);
R = R(1:8,1:8);
w = R\r;

end


function acf = autocorrelation(s)

acf = nan(9,1);
for k=0:8
    acf(k+1) = sum(s(k+1:end).*s(1:end-k));
end
end

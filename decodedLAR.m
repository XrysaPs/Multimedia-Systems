function decLAR = decodedLAR(LARc)
A = [20, 20, 20, 20, 13.637, 15, 8.334, 8.824]';
B = [0, 0, 4, -5, 0.184, -3.5, -0.666, -2.235]';

decLAR = nan(size(LARc));
for i=1:length(decLAR)
    decLAR(i) = (LARc(i) - B(i)) ./ A(i);
end

end
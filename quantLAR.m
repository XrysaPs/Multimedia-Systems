function qLAR = quantLAR(LAR)
A = [20, 20, 20, 20, 13.637, 15, 8.334, 8.824];
B = [0, 0, 4, -5, 0.184, -3.5, -0.666, -2.235];

qLAR = nan(size(LAR));
for i=1:length(qLAR)
    qLAR(i) = round(A(i)*LAR(i) + B(i));
end

end
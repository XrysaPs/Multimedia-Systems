function [decoded_xm] = decode_xm(xm_coded)

a=8192;
b=4096;
decoded_xm = nan(size(xm_coded));
for j=1:length(xm_coded)
    for i=0:7
        if xm_coded(j)==i
            decoded_xm(j) = b+a*(i-4);
            break;
        end
    end
    decoded_xm(j)=decoded_xm(j)./(2^15);
end
decoded_xm = decoded_xm';
end

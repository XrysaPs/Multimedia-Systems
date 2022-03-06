function [decode_xm] = decode_xm(xm_coded)

a=8192;
b=4096;

for j=1:length(xm_coded)
    for i=0:7
        if xm_coded(j)==i
            decode_xm(j) = b+a*(i-4);
            break;
        end
    end
    decode_xm(j)=decode_xm(j)./(2^15);
end
decode_xm = decode_xm';
end

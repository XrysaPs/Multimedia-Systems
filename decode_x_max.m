function [x_decoded] = decode_x_max(x_coded)
    if x_coded<=15
        x_decoded=32*(x_coded)+31;
    elseif x_coded>15 && x_coded<=23
        x_decoded=511+(x_coded-15)*64;
    elseif x_coded>23 && x_coded<=31
        x_decoded=1023+(x_coded-23)*128;
    elseif x_coded>31 && x_coded<=39
        x_decoded=2047+(x_coded-31)*256;
    elseif x_coded>39 && x_coded<=47
        x_decoded=4095+(x_coded-39)*512;
    elseif x_coded>47 && x_coded<=55
        x_decoded=8191+(x_coded-47)*1024;
    elseif x_coded>55 && x_coded<=63
        x_decoded=16383+(x_coded-55)*2048;
    end
end

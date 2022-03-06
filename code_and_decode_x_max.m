function [coded_x_max, dec_x_max] = code_and_decode_x_max(x_max)

if x_max<512
    coded_x_max = floor(x_max/32);
elseif x_max>=512 && x_max<1024
    coded_x_max = floor(x_max/64)+8;
elseif x_max>=1024 && x_max<2048
    coded_x_max = floor(x_max/128)+16;
elseif x_max>=2048 && x_max<4096
    coded_x_max = floor(x_max/256)+24;
elseif x_max>=4096 && x_max<8192
    coded_x_max = floor(x_max/512)+32;
elseif x_max>=8192 && x_max<16384
    coded_x_max = floor(x_max/1024)+40;
elseif x_max>=16384 && x_max<32768
    coded_x_max = floor(x_max/2048)+48;
end

if coded_x_max<=15
    dec_x_max=32*(coded_x_max)+31;
elseif coded_x_max>15 && coded_x_max<=23
    dec_x_max=511+(coded_x_max-15)*64;
elseif coded_x_max>23 && coded_x_max<=31
    dec_x_max=1023+(coded_x_max-23)*128;
elseif coded_x_max>31 && coded_x_max<=39
    dec_x_max=2047+(coded_x_max-31)*256;
elseif coded_x_max>39 && coded_x_max<=47
    dec_x_max=4095+(coded_x_max-39)*512;
elseif coded_x_max>47 && coded_x_max<=55
    dec_x_max=8191+(coded_x_max-47)*1024;
elseif coded_x_max>55 && coded_x_max<=63
    dec_x_max=16383+(coded_x_max-55)*2048;
end

end

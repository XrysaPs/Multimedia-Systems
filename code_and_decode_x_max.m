function [coded_x_max, dec_x_max] = code_and_decode_x_max(x_max)

% 1
a=0;
b=31;
if x_max >= a && x_max <= b
    coded_x_max = 0;
    dec_x_max = b;
end

% 2
a=b;
b=63;
if x_max > a && x_max <= b
    coded_x_max = 1;
    dec_x_max = b;
end

% 3
a=b;
b=95;
if x_max > a && x_max <= b
    coded_x_max = 2;
    dec_x_max = b;
end

% 4
a=b;
b=127;
if x_max > a && x_max <= b
    coded_x_max = 3;
    dec_x_max = b;
end

% 5
a=b;
b=159;
if x_max > a && x_max <= b
    coded_x_max = 4;
    dec_x_max = b;
end

% 6
a=b;
b=191;
if x_max > a && x_max <= b
    coded_x_max = 5;
    dec_x_max = b;
end

% 7
a=b;
b=223;
if x_max > a && x_max <= b
    coded_x_max = 6;
    dec_x_max = b;
end

% 8
a=b;
b=255;
if x_max > a && x_max <= b
    coded_x_max = 7;
    dec_x_max = b;
end

% 9
a=b;
b=287;
if x_max > a && x_max <= b
    coded_x_max = 8;
    dec_x_max = b;
end

% 10
a=b;
b=319;
if x_max > a && x_max <= b
    coded_x_max = 9;
    dec_x_max = b;
end

% 11
a=b;
b=351;
if x_max > a && x_max <= b
    coded_x_max = 10;
    dec_x_max = b;
end


% 12
a=b;
b=383;
if x_max > a && x_max <= b
    coded_x_max = 11;
    dec_x_max = b;
end

% 13
a=b;
b=415;
if x_max > a && x_max <= b
    coded_x_max = 12;
    dec_x_max = b;
end

% 14
a=b;
b=447;
if x_max > a && x_max <= b
    coded_x_max = 13;
    dec_x_max = b;
end

% 15
a=b;
b=479;
if x_max > a && x_max <= b
    coded_x_max = 14;
    dec_x_max = b;
end

% 16
a=b;
b=511;
if x_max > a && x_max <= b
    coded_x_max = 15;
    dec_x_max = b;
end

% 17
a=b;
b=575;
if x_max > a && x_max <= b
    coded_x_max = 16;
    dec_x_max = b;
end

% 18
a=b;
b=639;
if x_max > a && x_max <= b
    coded_x_max = 17;
    dec_x_max = b;
end

% 19
a=b;
b=703;
if x_max > a && x_max <= b
    coded_x_max = 18;
    dec_x_max = b;
end


% 20
a=b;
b=767;
if x_max > a && x_max <= b
    coded_x_max = 19;
    dec_x_max = b;
end

% 21
a=b;
b=831;
if x_max > a && x_max <= b
    coded_x_max = 20;
    dec_x_max = b;
end

% 22
a=b;
b=895;
if x_max > a && x_max <= b
    coded_x_max = 21;
    dec_x_max = b;
end


% 23
a=b;
b=959;
if x_max > a && x_max <= b
    coded_x_max = 22;
    dec_x_max = b;
end


% 24
a=b;
b=1023;
if x_max > a && x_max <= b
    coded_x_max = 23;
    dec_x_max = b;
end

% 25
a=b;
b=1151;
if x_max > a && x_max <= b
    coded_x_max = 24;
    dec_x_max = b;
end


% 26
a=b;
b=1279;
if x_max > a && x_max <= b
    coded_x_max = 25;
    dec_x_max = b;
end


% 27
a=b;
b=1407;
if x_max > a && x_max <= b
    coded_x_max = 26;
    dec_x_max = b;
end



% 28
a=b;
b=1535;
if x_max > a && x_max <= b
    coded_x_max = 27;
    dec_x_max = b;
end


% 29
a=b;
b=1663;
if x_max > a && x_max <= b
    coded_x_max = 28;
    dec_x_max = b;
end

% 30
a=b;
b=1791;
if x_max > a && x_max <= b
    coded_x_max = 29;
    dec_x_max = b;
end


% 31
a=b;
b=1919;
if x_max > a && x_max <= b
    coded_x_max = 30;
    dec_x_max = b;
end

% 32
a=b;
b=2047;
if x_max > a && x_max <= b
    coded_x_max = 31;
    dec_x_max = b;
end


% 33
a=b;
b=2303;
if x_max > a && x_max <= b
    coded_x_max = 32;
    dec_x_max = b;
end

% 34
a=b;
b=2559;
if x_max > a && x_max <= b
    coded_x_max = 33;
    dec_x_max = b;
end

% 35
a=b;
b=2815;
if x_max > a && x_max <= b
    coded_x_max = 34;
    dec_x_max = b;
end

% 36
a=b;
b=3071;
if x_max > a && x_max <= b
    coded_x_max = 35;
    dec_x_max = b;
end


% 37
a=b;
b=3327;
if x_max > a && x_max <= b
    coded_x_max = 36;
    dec_x_max = b;
end


% 38
a=b;
b=3583;
if x_max > a && x_max <= b
    coded_x_max = 37;
    dec_x_max = b;
end


% 39
a=b;
b=3839;
if x_max > a && x_max <= b
    coded_x_max = 38;
    dec_x_max = b;
end


% 40
a=b;
b=4095;
if x_max > a && x_max <= b
    coded_x_max = 39;
    dec_x_max = b;
end

% 41
a=b;
b=4607;
if x_max > a && x_max <= b
    coded_x_max = 40;
    dec_x_max = b;
end

% 42
a=b;
b=5119;
if x_max > a && x_max <= b
    coded_x_max = 41;
    dec_x_max = b;
end


% 43
a=b;
b=5631;
if x_max > a && x_max <= b
    coded_x_max = 42;
    dec_x_max = b;
end

% 44
a=b;
b=6143;
if x_max > a && x_max <= b
    coded_x_max = 43;
    dec_x_max = b;
end

% 45
a=b;
b=6655;
if x_max > a && x_max <= b
    coded_x_max = 44;
    dec_x_max = b;
end

% 46
a=b;
b=7167;
if x_max > a && x_max <= b
    coded_x_max = 45;
    dec_x_max = b;
end

% 47
a=b;
b=7679;
if x_max > a && x_max <= b
    coded_x_max = 46;
    dec_x_max = b;
end

% 48
a=b;
b=8191;
if x_max > a && x_max <= b
    coded_x_max = 47;
    dec_x_max = b;
end

% 49
a=b;
b=9215;
if x_max > a && x_max <= b
    coded_x_max = 48;
    dec_x_max = b;
end

% 50
a=b;
b=10239;
if x_max > a && x_max <= b
    coded_x_max = 49;
    dec_x_max = b;
end

% 51
a=b;
b=11263;
if x_max > a && x_max <= b
    coded_x_max = 50;
    dec_x_max = b;
end

% 52
a=b;
b=12287;
if x_max > a && x_max <= b
    coded_x_max = 51;
    dec_x_max = b;
end

% 53
a=b;
b=13311;
if x_max > a && x_max <= b
    coded_x_max = 52;
    dec_x_max = b;
end

% 54
a=b;
b=14335;
if x_max > a && x_max <= b
    coded_x_max = 53;
    dec_x_max = b;
end

% 55
a=b;
b=15359;
if x_max > a && x_max <= b
    coded_x_max = 54;
    dec_x_max = b;
end

% 56
a=b;
b=16383;
if x_max > a && x_max <= b
    coded_x_max = 55;
    dec_x_max = b;
end

% 57
a=b;
b=18431;
if x_max > a && x_max <= b
    coded_x_max = 56;
    dec_x_max = b;
end

% 58
a=b;
b=20479;
if x_max > a && x_max <= b
    coded_x_max = 57;
    dec_x_max = b;
end

% 59
a=b;
b=22527;
if x_max > a && x_max <= b
    coded_x_max = 58;
    dec_x_max = b;
end

% 60
a=b;
b=24575;
if x_max > a && x_max <= b
    coded_x_max = 59;
    dec_x_max = b;
end

% 61
a=b;
b=26632;
if x_max > a && x_max <= b
    coded_x_max = 60;
    dec_x_max = b;
end

% 62
a=b;
b=28671;
if x_max > a && x_max <= b
    coded_x_max = 61;
    dec_x_max = b;
end

% 63
a=b;
b=30719;
if x_max > a && x_max <= b
    coded_x_max = 62;
    dec_x_max = b;
end

% 64
a=b;
b=32767;
if x_max > a && x_max <= b
    coded_x_max = 63;
    dec_x_max = b;
end

end

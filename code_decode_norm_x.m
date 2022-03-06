 function [xM,x_coded] = code_decode_norm_x(norm_x)
xM = nan(size(norm_x));
x_coded = nan(size(norm_x));
for i=1:length(norm_x)
    
    if 2^(15)*norm_x(i) >= -32768 && 2^(15)*norm_x(i) < -24577
        xM(i) = -28672 / (2^(15));
        x_coded(i) = 0;
        
    elseif 2^(15)*norm_x(i) >= -24577 && 2^(15)*norm_x(i) < -16385
        xM(i) = -20480 / (2^(15));
        x_coded(i) = 1;
        
    elseif 2^(15)*norm_x(i) >= -16385 && 2^(15)*norm_x(i) < -8193
        xM(i) = -12288 / (2^(15));
        x_coded(i) = 2;
        
    elseif 2^(15)*norm_x(i) >= -8193 && 2^(15)*norm_x(i) < -1
        xM(i) = -4096 / (2^(15));
        x_coded(i) = 3;
        
    elseif 2^(15)*norm_x(i) >= -1 && 2^(15)*norm_x(i) < 8191
        xM(i) = 4096 / (2^(15));
        x_coded(i) = 4;
        
    elseif 2^(15)*norm_x(i) >= 8191 && 2^(15)*norm_x(i) < 16383
        xM(i) = 12288 / (2^(15));
        x_coded(i) = 5;
        
    elseif 2^(15)*norm_x(i) >= 16383 && 2^(15)*norm_x(i) < 24575
        xM(i) = 20480 / (2^(15));
        x_coded(i) = 6;
        
    elseif 2^(15)*norm_x(i) >= 24575 && 2^(15)*norm_x(i) <= 32767
        xM(i) = 28672 / (2^(15));
        x_coded(i) = 7;
        
    end
    
end


end
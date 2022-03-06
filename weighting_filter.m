function x = weighting_filter(e)
H = [-134, -374, 0, 2054, 5741, 8192, 5741, 2054, 0, -374, -134]' ./ (2^(13));

x = nan(40,1);
for k=1:40
   temp_e = nan(size(H));
   for i=1:length(H)
       if k+5-i < 1 || k+5-i > 40
           temp_e(i) = 0;
       else
           temp_e(i) = H(i)*e(k+5-i);
       end
   end
   x(k) = sum(H .* temp_e);
end

end

function [sro] = postprocessing(sr)

sro=zeros(160,1);
beta=28180*(2^(-15));
sro(1)=sr(1);

for k=2:length(sr)
    sro(k) = sr(k) + beta*sro(k-1);
end

end

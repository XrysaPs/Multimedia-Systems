function [s0,CurrFrmSTResd] = RPE_frame_SLT_decoder(LARc,Nc,bc,CurrFrmExFull,CurrFrmSTResd)
% [s0,CurrFrmSTResd] = RPE_frame_SLT_decoder(LARc,Nc,bc,PrevFrmExFull,PrevFrmSTResd)
% Inputs:
% LARc:          Coded LAR
% N:             Pitch
% bc:            Coded b
% CurrFrmExFull: Current frame e(n)
% CurrFrmSTResd: Current frame Residuals
% 
% Outputs:
% s0:            Vector consting of 160 samples
% CurrFrmSTResd: Current frame Residuals
%%
d = [];
e = CurrFrmExFull;

% 1)
dec_LAR = decodedLAR(LARc);
dec_N = Nc;
dec_b = [decode_b(bc(1)); decode_b(bc(2)); decode_b(bc(3)); decode_b(bc(4))];

% 2)
for j=1:4
    concatenated_frames = [CurrFrmSTResd; d];
    d_prime = e((j-1)*40+1 : j*40) + dec_b(j)*concatenated_frames( 40*(4+j-1)+1-dec_N(j) : 40*(4+j-1)-dec_N(j)+40 );
    d = [d; d_prime];
end

% 3)
ref = LAR2ref(dec_LAR);
a_k = rc2poly(ref);
s_dec = filter(1,a_k,d);

s0 = postprocessing(s_dec);
CurrFrmSTResd = d;

end
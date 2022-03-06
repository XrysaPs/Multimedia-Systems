function s0 = RPE_frame_ST_decoder(LARc,CurrFrmSTResd)
% s0 = RPE_frame_ST_decoder(LARc,CurrFrmSTResd)
% 
% Inputs:
% LARc:        Coded LAR
% CurrFrmResd: Current Frame Residuals
%
% Outputs:
% s0:          Vector consting of 160 samples
%%
dec_LAR = decodedLAR(LARc);
ref = LAR2ref(dec_LAR);
a_k = rc2poly(ref);
s_dec = filter(1,a_k,CurrFrmSTResd);

s0 = postprocessing(s_dec);
end
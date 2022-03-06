function [LARc, CurrFrmSTResd] = RPE_frame_ST_coder(s0)
% RPE_FRAME_ST_CODER
% [LARc, CurrFrmSTResd] = RPE_frame_ST_coder(s0)
% Inputs:
% s0:            Vector consting of 160 samples
% 
% Outputs:
% LARc:          Coded LAR
% CurrFrmSTResd: Current Frame Residuals
%% Preprocessing
s = preprocessing(s0); % Offset removal - Pre-emphasis
%% Short Term Analysis (frame)

w = predictor_weights(s);    % w: predictor
ref_coef = poly2rc([1 -w']); % w <--> r
LAR = ref2LAR(ref_coef);     % r <--> LAR
LARc = quant_code_LAR(LAR);  % LAR  -> coded LAR (LARc)
dec_LAR = decodedLAR(LARc);  % LARc -> decoded LAR (dec_LAR)
dec_ref = LAR2ref(dec_LAR);  % dec_LAR <--> decoded r (dec_r)
dec_w = rc2poly(dec_ref);    % dec_r <--> decoded w (dec_w)

FIR_filter = dec_w;
CurrFrmSTResd = filter(FIR_filter, 1, s);
end
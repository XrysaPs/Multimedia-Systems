function [LARc,N,bc,CurrFrmExFull,CurrFrmSTResd] = RPE_frame_SLT_coder(s0, PrevFrmSTResd)
% [LARc,N,bc,CurrFrmExFull,CurrFrmResd] = RPE_frame_SLT_coder(s0, PrevFrmResd)
% Inputs:
% s0:            Vector consting of 160 samples
% PrevFrmSTResd: Previous Frame Residuals
% 
% Outputs:
% LARc:          Coded LAR
% N:             Pitch
% bc:            Coded b
% CurrFrmExFull: Current frame e(n)
% CurrFrmSTResd: Current frame Residuals


subframes_size = 40;
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
d = filter(FIR_filter, 1, s);
%% Long Term Analysis (subframe)

CurrFrmSTResd = [];
NcS = nan(4,1);
bcS = nan(4,1);
CurrFrmExFull = [];
for j=1:4
    if length(d) == 160
        d_subframe = d((j-1)*subframes_size+1 : j*subframes_size);
    else
        d_subframe = d((j-1)*subframes_size+1 : end);
    end
    
    % (a) Estimation

    concatenated_d_PrevFrmResd = [PrevFrmSTResd; d]; 
    Prevd = concatenated_d_PrevFrmResd(40*(4+j-1)-120+1:40*(4+j-1));
    
    [N,b] = RPE_subframe_LTE(d_subframe, Prevd);
    NcS(j) = N;
    bc = coded_N_b(b);
    bcS(j) = bc;
    b_dec = decode_b(bc);
    
    % (b) Prediction
    
    concatenated_frames = [PrevFrmSTResd; d];
    d_hat = bc*concatenated_frames( 40*(4+j-1)+1-N : 40*(4+j-1)-N+40 );
    e = d_subframe - d_hat;
    CurrFrmExFull = [CurrFrmExFull; e];
    
    % (d) Synthesis
    
    d_prime = e + b_dec*concatenated_frames( 40*(4+j-1)+1-N : 40*(4+j-1)-N+40 );
    CurrFrmSTResd = [CurrFrmSTResd; d_prime];
    
    
end

N = NcS;
bc = bcS;

end
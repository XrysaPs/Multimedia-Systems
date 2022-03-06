function [FrmBitStrm, CurrFrmResd] = RPE_frame_coder(s0, PrevFrmResd)
% RPE_FRAME_CODER
% [FrmBitStrm, CurrFrmResd] = RPE_FRAME_CODER(s0, PrevFrmResd)
% Inputs:
% s0:          Vector consting of 160 samples
% PrevFrmResd: Previous Frame Residuals
% 
% Outputs:
% FrmBitStrm:  Frame Bit Stream
% CurrFrmResd: Current Frame Residuals

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

CurrFrmResd = [];
NcS = nan(4,1);
bcS = nan(4,1);
McS = nan(4,1);
x_McS = nan(13,4);
x_maxS = nan(4,1);
for j=1:4
    if length(d) == 160
        d_subframe = d((j-1)*subframes_size+1 : j*subframes_size);
    else
        d_subframe = d((j-1)*subframes_size+1 : end);
    end
    
    % (a) Estimation
    
    [Nc,bc] = pitch_b(d, j-1, PrevFrmResd);
    NcS(j) = Nc;
    bcS(j) = bc;
    b_dec = decode_b(bc);
    
    % (b) Prediction
    
    concatenated_frames = [PrevFrmResd; d];
    d_hat = bc*concatenated_frames( 40*(4+j-1)+1-Nc : 40*(4+j-1)-Nc+40 );
    e = d_subframe - d_hat;
    
    % (c) Excitation Computation
    
    x = weighting_filter(e);
    
    x0 = x(1:3:end-3);
    x1 = x(2:3:end-2);
    x2 = x(3:3:end-1);
    x3 = x(4:3:end);
    
    
    xS = [x0 x1 x2 x3];
    ExS = sum( xS.^2 );
    [~,Mc] = max(ExS);
    Mc = Mc - 1;
    McS(j) = Mc;
    
    x_M = xS(:,Mc+1);
    x_max = max(abs(x_M));
    
    % (i)
    
    [coded_x_max, dec_x_max] = code_and_decode_x_max(x_max);
    x_maxS(j) = coded_x_max;
    
    % (ii)
    
    norm_x = x_M / dec_x_max;
    [xM, x_Mc] = code_decode_norm_x(norm_x);
    x_McS(:,j) = x_Mc;
    
    % (d) Synthesis
    
    x_M_prime = xM * dec_x_max;
    
    e_prime = zeros(40,1);
    switch Mc
        case 0
            e_prime(1:3:37) = x_M_prime;
        case 1
            e_prime(2:3:38) = x_M_prime;
        case 2
            e_prime(3:3:39) = x_M_prime;
        case 3
            e_prime(4:3:40) = x_M_prime;
    end
    d_prime = e_prime + b_dec*concatenated_frames( 40*(4+j-1)+1-Nc : 40*(4+j-1)-Nc+40 );
    CurrFrmResd = [CurrFrmResd; d_prime];
    
    
end

%% Compose Frame
FrmBitStrm = [];

for iLAR=1:length(LARc)
    FrmBitStrm = [FrmBitStrm LARc(iLAR)];
end

for isubframe = 1:4
    FrmBitStrm = [FrmBitStrm, NcS(isubframe)];
	FrmBitStrm = [FrmBitStrm, bcS(isubframe)];
    FrmBitStrm = [FrmBitStrm, McS(isubframe)];
	FrmBitStrm = [FrmBitStrm, x_maxS(isubframe)];
    FrmBitStrm = [FrmBitStrm, x_McS(:,isubframe)'];
end

end
function [s0,CurrFrmResd] = RPE_frame_decoder(FrmBitStrm,CurrFrmResd)
% [s0,CurrFrmResd] = RPE_frame_decoder(FrmBitStrm,PrevFrmResd)
% Inputs:
% FrmBitStrm:  Frame Bit Stream
% CurrFrmResd: Current Frame Residuals
% 
% Outputs:
% s0:          Vector consting of 160 samples
% CurrFrmResd: Current Frame Residuals
%%
d = [];

% 1)
dec_LAR = decodedLAR((FrmBitStrm(1:8))');
dec_N = [FrmBitStrm(9); FrmBitStrm(26); FrmBitStrm(43); FrmBitStrm(60)];
dec_b = [decode_b(FrmBitStrm(10)); decode_b(FrmBitStrm(27)); decode_b(FrmBitStrm(44)); decode_b(FrmBitStrm(61))];
dec_M = [FrmBitStrm(11); FrmBitStrm(28); FrmBitStrm(45); FrmBitStrm(62)];
dec_x_max = [decode_x_max(FrmBitStrm(12)); decode_x_max(FrmBitStrm(29)); decode_x_max(FrmBitStrm(46)); decode_x_max(FrmBitStrm(63))];
dec_xm = [decode_xm(FrmBitStrm(13:25)) decode_xm(FrmBitStrm(30:42)) decode_xm(FrmBitStrm(47:59)) decode_xm(FrmBitStrm(64:76))];

% 2)
x_M_prime = nan(13,4);
for j=1:4
    x_M_prime(:,j) = dec_xm(:,j) .* dec_x_max(j);
    
    e_prime = zeros(40,1);
    switch dec_M(j)
        case 0
            e_prime(1:3:37) = x_M_prime(:,j);
        case 1
            e_prime(2:3:38) = x_M_prime(:,j);
        case 2
            e_prime(3:3:39) = x_M_prime(:,j);
        case 3
            e_prime(4:3:40) = x_M_prime(:,j);
    end
    concatenated_frames = [CurrFrmResd; d];
    d_prime = e_prime + dec_b(j)*concatenated_frames( 40*(4+j-1)+1-dec_N(j) : 40*(4+j-1)-dec_N(j)+40 );
    d = [d; d_prime];
end

% 3)
ref = LAR2ref(dec_LAR);
a_k = rc2poly(ref);
s_dec = filter(1,a_k,d);

s0 = postprocessing(s_dec);
CurrFrmResd = d;

end
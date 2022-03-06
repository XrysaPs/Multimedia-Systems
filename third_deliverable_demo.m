clear; clc; close all

[sig,Fs] = audioread("non_periodic.wav","native");
sig = double(sig);
frame_size = 160;

s=[];

for i=1:frame_size:length(sig)
    if i+frame_size-1 > length(sig)
        s0 = sig(i:end); 
    else
        s0 = sig(i:i+frame_size-1);
    end
    
    if i==1
        PrevFrmResd = s0;
    end
    
    [FrmBitStrm, CurrFrmResd] = RPE_frame_coder(s0, PrevFrmResd);
    
    [s0, CurrFrmResd] = RPE_frame_decoder(FrmBitStrm, CurrFrmResd);
    s = [s; s0];
    PrevFrmResd = CurrFrmResd;

end
soundsc(s,Fs);
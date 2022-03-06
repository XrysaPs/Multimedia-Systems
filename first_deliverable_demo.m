clear; clc; close all

[sig,Fs] = audioread("non_periodic.wav","native");
sig = double(sig);
frame_size = 160;


s=[];
PrevFrmResd = [];
for i=1:frame_size:length(sig)
    if i+frame_size-1 > length(sig)
        break
    else
        s0 = sig(i:i+frame_size-1);
    end

    [LARc, CurrFrmSTResd] = RPE_frame_ST_coder(s0);
    
    s0 = RPE_frame_ST_decoder(LARc, CurrFrmSTResd);
    s = [s; s0];


end
soundsc(s,Fs);

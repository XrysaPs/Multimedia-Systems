clear; clc; close all

[sig,Fs] = audioread("non_periodic.wav","native");
sig = double(sig);

frame_size = 160;

s=[];

for i=1:frame_size:length(sig)
    if i+frame_size-1 > length(sig)
        break
    else
        s0 = sig(i:i+frame_size-1);
    end
    
    if i==1
        PrevFrmSTResd = s0;
    end
    
    [LARc,N,bc,CurrFrmExFull,CurrFrmSTResd] = RPE_frame_SLT_coder(s0, PrevFrmSTResd);
    
    [s0,CurrFrmSTResd] = RPE_frame_SLT_decoder(LARc,N,bc,CurrFrmExFull,CurrFrmSTResd);
    s = [s; s0];
    PrevFrmSTResd = CurrFrmSTResd;
    
end
soundsc(s,Fs);

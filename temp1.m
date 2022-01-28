clear; clc; close all

data = load("voice_signal_non_periodic");
x = data.x;
N = length(x);
Fs = 8000;
t = linspace(0,(N-1)/Fs,N);
frame_size = 160;
subframes_size = 40;
n_subframes = 4;
%% Preprocessing
s = preprocessing(x);

%% LPC Analysis
for i=1:frame_size:length(x) 
    if i+frame_size-1 > length(x)
        s_frame = s(i:end); 
    else
        s_frame = s(i:i+frame_size-1);
    end
    predictor_order = 8;
    w = predictor_weights(s_frame, predictor_order);
    ref_coef = poly2rc(w);
    LAR = ref2LAR(ref_coef);
    qLAR = quantLAR(LAR);

    s_frame_hat = filter([1 -qLAR'],1,s_frame);
    d = s_frame - s_frame_hat;
end












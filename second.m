clear; clc; close all;

data = load('voice_signal_periodic');
x = data.x;
frame_size = 160;
subframes_size = 40;
n_subframes = 4;
N=zeros(3,2);

%% Preprocessing
s = preprocessing(x);

%% Long Term Analysis
previous_frame=s(1:160);
for i=1:frame_size:length(x)
    if i+frame_size-1 > length(x)
            s_frame = s(i:end);
        else
            s_frame = s(i:i+frame_size-1);
    end
    for j=1:subframes_size:length(s_frame)
        if j+subframes_size-1 > length(s_frame)
            s_subframe = s_frame(j:end);
        else
            s_subframe = s_frame(j:j-1+subframes_size);
        end
        current_subframe=floor(j/40);
        if i>1
            previous_frame=s(i-frame_size:i-1);
        end
        [N,b]=pitch_b(s_frame,current_subframe,previous_frame);
        
    end
end




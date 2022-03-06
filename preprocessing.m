function s = preprocessing(s0)
%% Offset compensation
alpha = 32735*2^(-15);
s_of = filter([1 -1], [1 -alpha], s0);
%% Pre-emphasis
beta = 28180*2^(-15);
s = filter([1 -beta], 1, s_of); 

end
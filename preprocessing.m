function [s] = preprocessing(s0, s0_previous, s_of_previous)

s_of = s0 - s0_previous + 32735*2^(-15)*s_of_previous;

s=s_of - 28180*2^(-15)*s_of_previous;

end
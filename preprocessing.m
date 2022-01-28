function [s] = preprocessing(s0, s0_previous, s_of_previous)

s_of = s0 - s0_previous + 32735*2^(-15)*s_of_previous;

s=s_of - 28180*2^(-15)*s_of_previous;

end

% Μου φαίνεται πως δεν μπορούμε να το κάνουμε έτσι, γιατί θα πρέπει να βάλουμε 3 ορίσματα 
% και το s_of_previous δεν ξέρω πως μπορούμε να το υπολογίσουμε...
% Επίσης, πιστεύω θα ήταν καλύτερα να έχουμε σαν είσοδο μόνο το σήμα ενδιαφέροντος.
% Έγραψα αυτά εγώ, και όντως διώχνει το offset που θέλουμε. Δες το και μπορούμε να το 
% συζητήσουμε.

function s = preprocessing(s0)

alpha = 32735*2^(-15);
beta = 28180*2^(-15);

s_of = nan(size(s0));
s_of(1) = s0(1);
for k=2:length(s_of)
    s_of(k) = s0(k) - s0(k-1) + alpha*s_of(k-1);
end

s = s_of(1:end-1) - beta*s_of(2:end);

s = [s; mean(s)];

end

function [C ia ic] = locatiev2(loc12, loc13, loc14, loc23, loc24, loc34)
A = [loc12 loc13 loc14 loc23 loc24 loc34];
[C ia ic] = unique(A,'rows');



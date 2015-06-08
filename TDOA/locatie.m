function [x1 x2 x3 x4 x5] = locatie(loc12, loc13, loc14, loc23, loc24, loc34, xsize, ysize, div)

loc12=loc12';
loc13=loc13';
loc14=loc14';
loc23=loc23';
loc24=loc24';
loc34=loc34';

x1 = intersect(loc12, loc13, 'rows')
x2 = intersect(loc12, loc14, 'rows')
x3 = intersect(loc12, loc23, 'rows')
x4 = intersect(loc12, loc24, 'rows')
x5 = intersect(loc12, loc34, 'rows')
%Waarden vergelijken

% clear all
% close all
% clc

%Parameters
% xsize = 2;
% ysize = 2;
% div = 1;

%Locaties Microfoons
% x1 = [0; 0];
% x2 = [413; 0];
% x3 = [413; 210];
% x4 = [0; 210];
% x5 = [173; 0];
% 
% xmic = [x1 x2 x3 x4 x5];

%Data binnenhalen
%functie van Kevin
%nu tijdelijke data
m=TDOAv0_1(8);
rafstand12 = 100*m(1)
rafstand13 = 100*m(2)
rafstand14 = 100*m(3)
rafstand23 = 100*m(4)
rafstand24 = 100*m(5)
rafstand34 = 100*m(6)

%Grid bouwen

%[r12 r13 r14 r23 r24 r34 xmax ymax] = rijgrid(xsize, ysize, xmic);


%Grid vergelijken
tic
[loc12 loc13 loc14 loc23 loc24 loc34] = matchgrid(xsize, ysize, div, rafstand12, rafstand13, rafstand14, rafstand23, rafstand24, rafstand34, r12, r13, r14, r23, r24, r34, xmax, ymax);
toc

%Plotter (indien nodig)
plotter(loc12, loc13, loc14, loc23, loc24, loc34);


%Locatie
[xp1 xp2 xp3 xp4 xp5] = locatie(loc12, loc13, loc14, loc23, loc24, loc34, xsize, ysize, div);

% A = [1 2 3 ; 10 0 30 ; 9 0 0]
% rowMean = sum(A,2) ./ sum(A~=0,2)




clear;
close all;
clc;

%Parameters
xsize = 3;
ysize = 3;
div = 3;

%Keuze vector (1 0 1 0 of 1 1 0 0 werkt het beste)
%  12 34 14 23 13 24
a = [1 0 0 0 0 1];

%Meting kiezen (1 tot 10)
m=TDOAv0_1(8);

%Locaties Microfoons
x1 = [0; 0];
x2 = [413; 0];
x3 = [413; 210];
x4 = [0; 210];
x5 = [173; 0];

xmic = [x1 x2 x3 x4 x5];

%Data binnenhalen
%functie van Kevin
%nu tijdelijke data
rafstand12 = 100*m(1);
rafstand13 = 100*m(2);
rafstand14 = 100*m(3);
rafstand23 = 100*m(4);
rafstand24 = 100*m(5);
rafstand34 = 100*m(6);

%Grid bouwen(eenmalig)
tic
[r12 r13 r14 r23 r24 r34 xmax ymax] = rijgrid(xsize, ysize, xmic);
toc

tic
%Grid vergelijken(iedere keer)
[loc12 loc13 loc14 loc23 loc24 loc34] = matchgrid(xsize, ysize, div, rafstand12, rafstand13, rafstand14, rafstand23, rafstand24, rafstand34, r12, r13, r14, r23, r24, r34, xmax, ymax);
toc

tic
%Locatie(iedere keer)
[x y] = locatie(loc12, loc13, loc14, loc23, loc24, loc34, a);
toc


% Plotter (indien nodig)
tic
plotter(loc12, loc13, loc14, loc23, loc24, loc34, x, y);
toc


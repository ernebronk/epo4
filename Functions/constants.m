% CAR = 8 = 32B3
global state;


% Test variables
    COM_PORT    = 37;
    DELAY       = 0.4;
    LIVE        = 0;
    state       = 0;
    

% Globals
global DEBUG;
global dirRight;
global dirLeft;
global dirNeutral;
global n;
global logboek;
n = 2;
DEBUG = true;
logboek{1, 1} = 'Time';
logboek{1, 2} = 'Xpos';
logboek{1, 3} = 'Ypos';
logboek{1, 4} = 'Battery';
logboek{1, 5} = 'Speed';
logboek{1, 6} = 'Direction';


% System Constants
conn_state = 0;
target = [ 5 10 ];


% Car constants
speed_tx        = 150;
speed_rx        = 0;
dirNeutral     = 150;
dir_rx          = 0;
dir_tx          = 150;
dirRight        = 160;
dirLeft         = 140;
minBat          = 18000; %Minimal value in mV;
fwdSpeed        = 158;
carpos          = [ 5 0 ];
carposp         = [ 5 -1 ];

res = 1;


% Marcstuk

%Parameters
xsize = 2;
ysize = 2;
div = 1;
x1 = [0; 0];
x2 = [413; 0];
x3 = [413; 210];
x4 = [0; 210];
x5 = [173; 0];
xmic = [x1 x2 x3 x4 x5];
[r12 r13 r14 r23 r24 r34 xmax ymax] = rijgrid(xsize, ysize, xmic);

m=TDOAv0_1(8);
rafstand12 = 100*m(1)
rafstand13 = 100*m(2)
rafstand14 = 100*m(3)
rafstand23 = 100*m(4)
rafstand24 = 100*m(5)
rafstand34 = 100*m(6)




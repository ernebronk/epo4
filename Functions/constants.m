% CAR = 8 = 32B3
global state;
global LIVE;


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
target1 = [ 270 100 ];
target2 = [ 10 10];
target = [0 0];


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

res = 10;







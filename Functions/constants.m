% CAR = 8 = 32B3

% Test variables
    COM_PORT    = 38;
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
DEBUG = false;
logboek{1, 1} = 'Time';
logboek{1, 2} = 'Xpos';
logboek{1, 3} = 'Ypos';
logboek{1, 4} = 'Battery';


% System Constants
conn_state = 0;
target = [ 10 10 ];


% Car constants
speed_tx        = 150;
speed_rx        = 0;
dirNeutral     = 150;
dir_rx          = 0;
dir_tx          = 150;
dirRight        = 160;
dirLeft         = 140;
minBat          = 18000; %Minimal value in mV;
fwdSpeed        = 154;
carpos          = [ 1 0 ];
carposp         = [ 1 -1 ];

res = 0;



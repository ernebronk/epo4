% CAR = 8 = 32B3
global state;
global LIVE;

x1 = [0; 0];
x2 = [6.5; 0];
x3 = [6.5; 5.5];
x4 = [0; 5.5];
x5 = [3; 0];
locs = [x1'
    x2'
    x3'
    x4'
    x5'];
% des = [4 1.5];
% way = [1 1]
% obs = [1.2 1.2]

    %EPO4figure.setMicLoc(locs)

% Test variables
    COM_PORT    = 94;
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
DEBUG = false;
logboek{1, 1} = 'Time';
logboek{1, 2} = 'Xpos';
logboek{1, 3} = 'Ypos';
logboek{1, 4} = 'Battery';
logboek{1, 5} = 'Speed';
logboek{1, 6} = 'Direction';


% System Constants
conn_state = 0;
target1 = [ 100 100 ];
target2 = [ 100 100];
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
fwdSpeed        = 154;
carpos          = [ 300 540 ];
carposp         = [ 300 600 ];

res = 100;







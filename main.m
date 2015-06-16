% Final challnge file
% Clear the workspace
    clear all;
    close all;
    clc;
    addpath('Functions');
    addpath('Zwaluabeunmap');

% Start the program
%    result =  program();

format shortg
t = clock;
tic




figure('WindowKeyPressFcn', @STOP)
btn = uicontrol('Style', 'pushbutton', 'String', 'STOP',...
        'Position', [20 20 100 20],...
        'Callback', @STOP);  

global gui;

gui.data.xpos = 'No Data';
gui.data.ypos = 'No Data';
gui.data.hdg  = 'No Data';

gui.data.names.xpos = 'X Position: ';
gui.data.names.ypos = 'Y Position: ';
gui.data.names.hdg  = 'HDG :';

gui.hdg = uicontrol('Style', 'text',...
                     'String', [gui.data.names.hdg gui.data.hdg],...
                     'Position', [20 80 100 20]);
gui.xpos = uicontrol('Style', 'text',...
                     'String', [gui.data.names.xpos gui.data.xpos],...
                     'Position', [20 60 100 20]);
gui.ypos = uicontrol('Style', 'text',...
                     'String', [gui.data.names.ypos gui.data.xpos],...
                     'Position', [20 40 100 20]);





%% Test var
program;
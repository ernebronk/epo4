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
        'Position', [20 20 50 20],...
        'Callback', @STOP);  

program;
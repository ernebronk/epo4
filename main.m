% Final challnge file
% Clear the workspace
    clear all;
    close all;
    clc;
    addpath('Functions');
% Start the program
%    result =  program();

format shortg
t = clock;

target = [ 0 3 ];
car = [ 2 5 ];
carp = [ 4 3 ];
tic

name = '';

for n = 1:6
    x = t(n);
    name = [name '_' num2str(x)];
end


name = ['logs/' name '.mat'];
save(name);

%program;
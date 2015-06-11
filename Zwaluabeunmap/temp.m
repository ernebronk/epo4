close all;
clear all;
clc;

% load log2.mat

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

    EPO4figure.setMicLoc(locs)
%      EPO4figure.setWayPoint(way)
%      EPO4figure.setDestination(des)
%    
%     EPO4figure.setObstacle(obs)
for i=1:100
%  mic = squeeze(log(i,:,:));
 mic = pa_wavrecord(3, 7, 28800, 48000,0 )';
 m = TDOAv1_0(mic);
     log(i,:,:)=mic;
     logm(i,:) = m;
     [x y] = mainloc(m);
     logxy(i,:) = [x y];
     kitt = [x/100 y/100]
     EPO4figure.setKITT(kitt)
     pause(1)
end

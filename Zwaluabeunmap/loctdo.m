function [x y] = loctdo()

%      EPO4figure.setWayPoint(way)
%      EPO4figure.setDestination(des)
%    
%     EPO4figure.setObstacle(obs)
% for i=1:100
%  mic = squeeze(log(i,:,:));
     mic = pa_wavrecord(3, 7, 28800, 48000,0 )';
     m = TDOAv1_0(mic);
     [x y] = mainloc(m);
     kitt = [x/100 y/100]
%     EPO4figure.setKITT(kitt)
%      pause(1)
end
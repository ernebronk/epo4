function [x y] = loctdo()

global LIVE;

%      EPO4figure.setWayPoint(way)
%      EPO4figure.setDestination(des)
%    
%     EPO4figure.setObstacle(obs)
% for i=1:100
%  mic = squeeze(log(i,:,:));
    if(LIVE)
     mic = pa_wavrecord(3, 7, 28800, 48000,0 )';
     m = TDOAv1_0(mic);
    else
        m = TDOAv0_1(1);
    end
     [x y] = mainloc(m);
     kitt = [x/100 y/100]
%     EPO4figure.setKITT(kitt)
%      pause(1)
end
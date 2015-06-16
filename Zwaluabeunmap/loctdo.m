function [x y] = loctdo()

global LIVE;
global mic;

%      EPO4figure.setWayPoint(way)
%      EPO4figure.setDestination(des)
%    
%     EPO4figure.setObstacle(obs)
% for i=1:100
%  mic = squeeze(log(i,:,:));
    if(LIVE)
     mic = pa_wavrecord(3, 7, 86400, 48000,0 )';
     mic1 = mic(:,1:28800);
     mic2 = mic(:,28801:57600);
     mic3 = mic(:,57600:86400);
     m1 = TDOAv1_0(mic1);
     m2 = TDOAv1_0(mic2);
     m3 = TDOAv1_0(mic3);
    if round(m1/m2)==round(m2/m1)
         m = (m1+m2)./2
    elseif round(m1/m3)==round(m3/m1)
         m = (m1+m3)./2
    elseif round(m2/m3)==round(m3/m2)
         m = (m2+m3)./2
    else
         m = m1
    end
    else
        m = TDOAv0_1(1);
    end
     [x y] = mainloc(m);
     kitt = [x/100 y/100];
     EPO4figure.setKITT(kitt)
%      pause(1)
end
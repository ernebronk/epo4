function [h,micar] = calch(mic,locsm) %sort h by checking where the signal arrives first
micar = [1:10];
if locsm(1) <= locsm(2)
    micar(1) = -1;
else
    micar(1) = 1;
end
if locsm(1) <= locsm(3)
    micar(2) = -1;
else
    micar(2) = 1;
end
if locsm(1) <= locsm(4)
    micar(3) = -1;
else
    micar(3) = 1;
end
if locsm(2) <= locsm(3)
    micar(4) = -1;
else
    micar(4) = 1;
end
if locsm(2) <= locsm(4)
    micar(5) = -1;
else
    micar(5) = 1;
end
if locsm(3) <= locsm(4)
    micar(6) = -1;
else
    micar(6) = 1;
end
if locsm(1) <= locsm(5)
    micar(7) = -1;
else
    micar(7) = 1;
end
if locsm(2) <= locsm(5)
    micar(8) = -1;
else
    micar(8) = 1;
end
if locsm(3) <= locsm(5)
    micar(9) = -1;
else
    micar(9) = 1;
end
if locsm(4) <= locsm(5)
    micar(10) = -1;
else
    micar(10) = 1;
end
    h(1,:) = abs(ch3(mic(1,:)',mic(2,:)));
    h(2,:) = abs(ch3(mic(1,:)',mic(3,:)));    
    h(3,:) = abs(ch3(mic(1,:)',mic(4,:)));
    h(4,:) = abs(ch3(mic(2,:)',mic(3,:)));
    h(5,:) = abs(ch3(mic(2,:)',mic(4,:)));
    h(6,:) = abs(ch3(mic(3,:)',mic(4,:)));
    h(7,:) = abs(ch3(mic(1,:)',mic(5,:)));
    h(8,:) = abs(ch3(mic(2,:)',mic(5,:)));
    h(9,:) = abs(ch3(mic(3,:)',mic(5,:)));
    h(10,:) = abs(ch3(mic(4,:)',mic(5,:)));
    
end

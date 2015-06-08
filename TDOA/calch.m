function [h,micar] = calch(mic,locsm) %sort h by checking where the signal arrives first
micar = [1:10];
if locsm(1) <= locsm(2)
    h(1,:) = abs(ch3(mic(1,:)',mic(2,:)));
    micar(1) = -1;
else
    h(1,:) = abs(ch3(mic(2,:)',mic(1,:)));
    micar(1) = 1;
end
if locsm(1) <= locsm(3)
    h(2,:) = abs(ch3(mic(1,:)',mic(3,:)));
    micar(2) = -1;
else
    h(2,:) = abs(ch3(mic(3,:)',mic(1,:)));
    micar(2) = 1;
end
if locsm(1) <= locsm(4)
    h(3,:) = abs(ch3(mic(1,:)',mic(4,:)));
    micar(3) = -1;
else
    h(3,:) = abs(ch3(mic(4,:)',mic(1,:)));
    micar(3) = 1;
end
if locsm(2) <= locsm(3)
    h(4,:) = abs(ch3(mic(2,:)',mic(3,:)));
    micar(4) = -1;
else
    h(4,:) = abs(ch3(mic(3,:)',mic(2,:)));
    micar(4) = 1;
end
if locsm(2) <= locsm(4)
    h(5,:) = abs(ch3(mic(2,:)',mic(4,:)));
    micar(5) = -1;
else
    h(5,:) = abs(ch3(mic(4,:)',mic(2,:)));
    micar(5) = 1;
end
if locsm(3) <= locsm(4)
    h(6,:) = abs(ch3(mic(3,:)',mic(4,:)));
    micar(6) = -1;
else
    h(6,:) = -abs(ch3(mic(3,:)',mic(4,:)));
    micar(6) = 1;
end
if locsm(1) <= locsm(5)
    h(7,:) = abs(ch3(mic(1,:)',mic(5,:)));
    micar(7) = -1;
else
    h(7,:) = abs(ch3(mic(5,:)',mic(1,:)));
    micar(7) = 1;
end
if locsm(2) <= locsm(5)
    h(8,:) = abs(ch3(mic(2,:)',mic(5,:)));
    micar(8) = -1;
else
    h(8,:) = abs(ch3(mic(5,:)',mic(2,:)));
    micar(8) = 1;
end
if locsm(3) <= locsm(5)
    h(9,:) = abs(ch3(mic(3,:)',mic(5,:)));
    micar(9) = -1;
else
    h(9,:) = abs(ch3(mic(5,:)',mic(3,:)));
    micar(9) = 1;
end
if locsm(4) <= locsm(5)
    h(10,:) = abs(ch3(mic(4,:)',mic(5,:)));
    micar(10) = -1;
else
    h(10,:) = abs(ch3(mic(5,:)',mic(4,:)));
    micar(10) = 1;
end
end

function send(dir, speed)
global LIVE;
dir = num2str(dir);
speed = num2str(speed);
stati = ['D' dir ' ' speed];
disp(stati);
if (LIVE)
EPOCommunications('transmit' , stati);
else
EPOCommunications1('transmit' , stati);
end
end
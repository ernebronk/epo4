function send(dir, speed)
dir = num2str(dir);
speed = num2str(speed);
stati = ['D' dir ' ' speed];
disp(stati);
EPOCommunications('transmit' , stati);
end
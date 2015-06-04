function battery = status()

global logboek;
global n;

status = EPOCommunications('transmit','S'); % request status string
dircar      = str2num(status(2:4));
speedcar    = str2num(status(6:8));
[t_status ~,] = strsplit(status,{' ','U','A', 'D'});
distancel = str2double(t_status(4));
distancer = str2double(t_status(5));
battery = str2double(t_status(6));

logboek{n,4} = battery;

if battery <= 0
    disp('Error: Recieved invalid data (battery)')
elseif battery >= 22000
    battery = 20000;
    disp('Error: Recieved invalid data (battery)')
end;

end 
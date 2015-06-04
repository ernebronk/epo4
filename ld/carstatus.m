function  carstatus()

global dircar;
global speedcar;
global status;
global battery;
global timer1;
global emulator;
global maxrxtime;
global distancel;
global distancer;
global n;
global carlog;
global LIVE;
global timerlog;
global logboek;
global afstand;
global speedo;
global m;
global setstop;


clear status;
res = 0;
tic;
res = tic;
if(emulator)
    status = emulator_status();
else
    if(LIVE)
    status = EPOCommunications('transmit','S'); % request status string
    end
end
timer1 = toc;



%-------------Recieving data from car----------------------------------
%Status string knippen in dircar en speedcar
dircar      = str2num(status(2:4));
speedcar    = str2num(status(6:8));
%Statusstring splitsen tussen ' ', 'A', 'D', 'U'.
%Dit doen we omdat de de lengte van de statusstring variabel is
[t_status ~,] = strsplit(status,{' ','U','A', 'D'});
distancel = str2double(t_status(4));
distancer = str2double(t_status(5));
battery = str2double(t_status(6));
afstand = dfilter(distancel, distancer);
%Wegschrijven naar logboek
carlog{n}   = cellstr(status);
timerlog(n) = timer1;
% afstand1(n) = afstand
logboek{n,1}=carlog{n};
logboek{n,2}=timerlog(n);
logboek{n,3}=afstand;
%-------------Error Noticing Code for recieved data------------------

disp(afstand);

drempel = 160;

if (afstand > drempel && setstop == 1);
    speedo = 159;
end;

if (afstand < drempel && setstop == 1)distancer
    speedo = 150;
    if(setstop == 1 && n > 6)
        setstop = 2;
        m=n;
    end
end;

if(afstand < drempel && setstop == 2 && n == m + 1)
    speedo = 142;
    if(setstop == 2 && n > 6)
        setstop = 3;
    end
end

if (setstop == 3 && n == m + 2)
    speedo = 150;
    stopprogram();
end



%Timer ECC
if timer1 >= maxrxtime
     stopprogram();
     disp('Error: Data took to long to recieve. Emergency Stop engaged');
end;

%Speedo ENC
if speedcar < 135
    disp('Error: Recieved invalid data (speedcar)')
elseif speedcar > 165
    disp('Error: Recieved invalid data (speedcar)')
end;

%Direction ENC
if dircar < 100
    disp('Error: Recieved invalid data (dircar)')
elseif dircar > 200
    disp('Error: Recieved invalid data (dircar)')
end;

%Battery ECC
if battery <= 0
    disp('Error: Recieved invalid data (battery)')
elseif battery >= 22000
    battery = 20000;
    disp('Error: Recieved invalid data (battery)')
end;




end
function [m] = TDOAv1_0()

%recording sample
audiodevinfo
ID = findInDevID('Ingang achter (SoundMAX Integra');
mic = pa_wavrecord(1, 5, 14400, 48000,ID )';

%preset values
Fs = 48000;
v = 343; 
m = 1:10;
locsm=1:5;

if mean(abs(mic(1,1:100))) >= mean(abs(mic(1,1000:1100)))
    [pk,locs] = findpeaks(mic(1,:),'MinPeakHeight',0.9*max(mic(1,:)));
    for i=1:5
        mic(i,1:10001) = mic(i,locs-1000:locs+9000);
    end    
end

for i=1:5
    [pk,locs] = findpeaks(mic(i,:),'MinPeakHeight',0.2*max(mic(i,:)));
    locsm(i)=locs(1);
end

[h,micar] = calch(mic,locsm);

for i=1:10                 
    [pk,locs] = findpeaks(abs(h(i,:)),'MinPeakHeight',0.9*abs(max(h(i,:))));
    locst = locs(1);
    if locst >= 690 
        [pk,locs] = findpeaks(fliplr(h(i,:)),'MinPeakHeight',0.9*max(h(i,:)));
        locst = locs(1);
    end
    n = locst;      %Distance in meters in vector m
    t = n/Fs;
    m(i) = v*t;
    if i < 7                 %compensate for the height of the microphones
        m(i) = micar(i)*abs(sqrt(m(i)^2-0.03^2));
    else
        m(i) = micar(i)*abs(sqrt(m(i)^2-0.50^2));
    end
end
end
   
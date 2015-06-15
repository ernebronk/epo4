function [m] = TDOAv1_0(mic)



%recording sample
%audiodevinfo
%ID = findInDevID('Ingang achter (SoundMAX Integra');


%preset values
Fs = 48000;
v = 343; 
m = 1:6;
locsm=1:5;


if mean(abs(mic(1,1:1000))) >= mean(abs(mic(1,4000:6000)))
    [pk,locs] = findpeaks(mic(1,:),'MinPeakHeight',0.70*max(mic(1,:)));
    a = locs;
    if locs(1) >= 2500
    for i=1:5
        mic(i,1:length(mic(i,locs(1)-3000:length(mic)))) = mic(i,locs(1)-3000:length(mic));    
    end
    end
end
for i=1:5
    [pk,locs] = findpeaks(mic(i,:),'MinPeakHeight',0.3*max(mic(i,:)));
    locsm(i)=locs(1);
end
[h,micar] = calch(mic,locsm);

for i=1:6                
    [pk,locs] = findpeaks(abs(h(i,:)),'MinPeakHeight',0.6*abs(max(h(i,:))));
    locst = locs(1);
    if locst >= 12000 
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
   
function [m] = TDOAv0_1(meting)
[mic] = datagen(meting); %See table below
%1 = ref mic 1
%2 = ref mic 2
%3 = ref mic 3
%4 = ref mic 4
%5 = ref mic 5                  M4_____________1_______________M3  Field is 210x413
%6 = location A (102,70)        |                               |
%7 = location B (155,105)       |          B                    |
%8 = location C (216,88)        |                  C            2
%9 = location 1 (206,210)       |     A                         |
%10 = location 2 (413,105)      M1_____________M5______________M2

%preset values
Fs = 48000;
v = 343; 
m = 1:10;
locsm=1:5;

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
   
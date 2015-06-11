close all;
clear all;
clc;
 for i=1:10
mic = pa_wavrecord(3, 7, 28800, 48000,0 )';
m = TDOAv1_0(mic);
hold on
logm(i,:) = m;
log(i,:,:)=mic;
pause(0.1)
[x y] = mainloc(m);
 end

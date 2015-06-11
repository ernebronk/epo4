mic1 = squeeze(log(7,:,:));
mic2 = squeeze(log(7,:,:));
micref1 = mic1;
micref2 = mic2;
if mean(abs(mic1(4,1:1000))) >= mean(abs(mic1(1,4000:8000)))
    [pk,locs] = findpeaks(mic1(1,:),'MinPeakHeight',0.75*max(mic1(1,:)));
    for i=1:5
        L1 = length(mic(1,:))
        L = length(mic1(i,locs-3000:L1))        
       mic1(i,1:L) = mic1(i,locs-3000:L1);
    end    
end
if mean(abs(mic2(1,500:1500))) >= mean(abs(mic2(1,4000:6000)))
    [pk,locs] = findpeaks(mic2(1,:),'MinPeakHeight',0.75*max(mic2(1,:)));
    for i=1:5
       mic2(i,1:15001) = mic2(i,locs-3000:locs+12000);
    end    
end

% 
% figure
% subplot(411)
% plot(meting3(1,:))
% subplot(412)
% plot(meting3(2,:))
% subplot(413)
% plot(meting4(1,:))
% subplot(414)
% plot(meting4(2,:))
figure
subplot(411)
plot(micref1(1,:))
subplot(412)
plot(micref1(2,:))
subplot(413)
plot(micref2(3,:))
subplot(414)
plot(mic2(4,:))
% figure
% subplot(411)
% plot(micref2(1,:))
% subplot(412)
% plot(micref2(2,:))
% subplot(413)
% plot(mic2(1,:))
% subplot(414)
% plot(mic2(2,:))


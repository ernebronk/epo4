function plotter(loc12, loc13, loc14, loc23, loc24, loc34, x ,y);

%Plotter
xxp1 = [0 ; 650];
yxp1 = [y; y];
xxp2 = [x ; x];
yxp2 = [0; 550];

%plot voorbereiden
figure(1)
hold on

locx12 = loc12(1,:);
locx13 = loc13(1,:);
locx14 = loc14(1,:);
locx23 = loc23(1,:);
locx24 = loc24(1,:);
locx34 = loc34(1,:);

locy12 = loc12(2,:);
locy13 = loc13(2,:);
locy14 = loc14(2,:);
locy23 = loc23(2,:);
locy24 = loc24(2,:);
locy34 = loc34(2,:);

clear loc12
clear loc13
clear loc14
clear loc23
clear loc24
clear loc34

%r12
plot(locx12,locy12,'b*')
%r13
plot(locx13,locy13,'r*')
%r14
plot(locx14,locy14,'g*')
%r23
plot(locx23,locy23,'c*')
%r24
plot(locx24,locy24,'m*')
%34
plot(locx34,locy34,'*')

%x y plotten
plot(xxp1,yxp1,'r-.');
plot(xxp2,yxp2,'r-.');





%grafiek opmaken
stap = 50;
tickValues = 0:stap:660;

axis([0 660 0 550]); %veld forceren
grid('on');
set(gca,'XTick',tickValues,'YTick',tickValues);
xlabel('Positie in centimeters');
ylabel('Positie in centimeters');
legend('12','13','14','23','24','34','locatie');

a = 1;
end
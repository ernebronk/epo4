global n;
clear all;
close all;
clc

constants;
logboek{1,4} = 'Xpos P';
logboek{1,5} = 'Ypos P';
logboek{1,6} = 'XTarget';
logboek{1,7} = 'YTarget';


for n = 2:2
%testfule
   x = randi(413, 1, 3);
   y = randi(210, 1, 3);
   xcar = x(1);
   ycar = y(1);
   logboek{n,2} = x(1);
   logboek{n,3} = y(1);
   xcarp = x(2);
   ycarp = y(2);
   logboek{n,4} = x(2);
   logboek{n,5} = y(2);
   xtarget = x(3);
   ytarget = y(3);
   logboek{n,6} = x(3);
   logboek{n,7} = y(3);

dir = nav([xcar ycar], [xcarp ycarp], [xtarget ytarget])

logboek{n,10} = dir;
end
hold on;
scatter(x(1), y(1))
scatter(x(2), y(2))
scatter(x(3), y(3))
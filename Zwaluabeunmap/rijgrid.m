function [r12 r13 r14 r23 r24 r34 xmax ymax] = rijgrid(xsize, ysize, xmic)

%-------------------------------------------------------------------------
%Input:
% xsize, ysize, microfoon(2,5) 
%Output
% r12 r13 r14 r23 r24 r34

% Gridbuilder
% Deze functie verdeeld het veld in een grid
% De afmetingen van de vakjes zijn xsize bij ysize
% Voor ieder vakje wordt R_ij berekend zoals dat in de handleiding gedaan
% wordt
% Dit gebeurt slechts een keer om tijd en geheugen te besparen
%-------------------------------------------------------------------------

%xmic matrix splitsen in x1 t/m x5
x1 = [xmic(1,1) ; xmic(2,1)];
x2 = [xmic(1,2) ; xmic(2,2)];
x3 = [xmic(1,3) ; xmic(2,3)];
x4 = [xmic(1,4) ; xmic(2,4)];
x5 = [xmic(1,5) ; xmic(2,5)];

%Uiteinde veld bepalen (op basis van microfoons 2 en 4)
xmax = max(x2);
ymax = max(x4);

%X en Y loop maken
%Hier wordt de grote van de rij matrix bepaald
xloop = 1:xsize:xmax;
yloop = 1:ysize:ymax;

%------------------------grid opbouwen------------------------------------
% Deze for loop zet alle mogelijkheden in een grid met vakjes van xsize bij
% ysize
% r12 = sqrt( (x-x1(1))^2 + (y-x1(2))^2 ) - sqrt( (x-x2(1))^2 + (y-x2(2))^2 )

% r12
for y = 1:length(yloop)
    for x = 1:length(xloop)
        r12(y,x) = sqrt( (xloop(x)-x1(1))^2 + (yloop(y)-x1(2))^2 ) - sqrt( (xloop(x)-x2(1))^2 + (yloop(y)-x2(2))^2 );
        x = x+1;
    end
    y = y + 1;
end
clear x y
disp('r12 matrix klaar')

% r13
for y = 1:length(yloop)
    for x = 1:length(xloop)
        r13(y,x) = sqrt( (xloop(x)-x1(1))^2 + (yloop(y)-x1(2))^2 ) - sqrt( (xloop(x)-x3(1))^2 + (yloop(y)-x3(2))^2 );
        x = x+1;
    end
    y = y + 1;
end
clear x y
disp('r13 matrix klaar')

% r14
for y = 1:length(yloop)
    for x = 1:length(xloop)
        r14(y,x) = sqrt( (xloop(x)-x1(1))^2 + (yloop(y)-x1(2))^2 ) - sqrt( (xloop(x)-x4(1))^2 + (yloop(y)-x4(2))^2 );
        x = x+1;
    end
    y = y + 1;
end
clear x y
disp('r14 matrix klaar')

% r23
for y = 1:length(yloop)
    for x = 1:length(xloop)
        r23(y,x) = sqrt( (xloop(x)-x2(1))^2 + (yloop(y)-x2(2))^2 ) - sqrt( (xloop(x)-x3(1))^2 + (yloop(y)-x3(2))^2 );
        x = x+1;
    end
    y = y + 1;
end
clear x y
disp('r23 matrix klaar')

% r24
for y = 1:length(yloop)
    for x = 1:length(xloop)
        r24(y,x) = sqrt( (xloop(x)-x2(1))^2 + (yloop(y)-x2(2))^2 ) - sqrt( (xloop(x)-x4(1))^2 + (yloop(y)-x4(2))^2 );
        x = x+1;
    end
    y = y + 1;
end
clear x y
disp('r24 matrix klaar')

% r34
for y = 1:length(yloop)
    for x = 1:length(xloop)
        r34(y,x) = sqrt( (xloop(x)-x3(1))^2 + (yloop(y)-x3(2))^2 ) - sqrt( (xloop(x)-x4(1))^2 + (yloop(y)-x4(2))^2 );
        x = x+1;
    end
    y = y + 1;
end
clear x y
disp('r34 matrix klaar')

end

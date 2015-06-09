function [x y] = locatie(loc12, loc13, loc14, loc23, loc24, loc34)
%Alle vectoren transponeren
loc12=loc12';
loc13=loc13';
loc14=loc14';
loc23=loc23';
loc24=loc24';
loc34=loc34';

%Bereken intersectie punten met 12 en alle andere combinaties
x1a = intersect(loc12, loc13, 'rows');
x2a = intersect(loc12, loc14, 'rows');
x3a = intersect(loc12, loc23, 'rows');
x4a = intersect(loc12, loc24, 'rows');
x5a = intersect(loc12, loc34, 'rows');

%Splits de gevonden resultaten in x en y en haal alle nullen eruit
xax = [x1a(:,1); x2a(:,1); x3a(:,1); x4a(:,1); x5a(:,1)];
xay = [x1a(:,2); x2a(:,2); x3a(:,2); x4a(:,2); x5a(:,2)];
xax(xax == 0) = [];
xay(xay == 0) = [];

% x1b = intersect(loc34, loc12, 'rows');
% x2b = intersect(loc34, loc13, 'rows');
% x3b = intersect(loc34, loc24, 'rows');
% x4b = intersect(loc34, loc23, 'rows');
% x5b = intersect(loc34, loc24, 'rows');
% 
% xbx = [x1b(:,1); x2b(:,1); x3b(:,1); x4b(:,1); x5b(:,1)];
% xby = [x1b(:,2); x2b(:,2); x3b(:,2); x4b(:,2); x5b(:,2)];
% xbx(xbx == 0) = [];
% xby(xby == 0) = [];

%Bereken intersectie punten met 14 en alle andere combinaties
x1c = intersect(loc14, loc12, 'rows');
x2c = intersect(loc14, loc13, 'rows');
x3c = intersect(loc14, loc23, 'rows');
x4c = intersect(loc14, loc24, 'rows');
x5c = intersect(loc14, loc34, 'rows');

%Bereken intersectie punten met 12 en alle andere combinaties
xcx = [x1c(:,1); x2c(:,1); x3c(:,1); x4c(:,1); x5c(:,1)];
xcy = [x1c(:,2); x2c(:,2); x3c(:,2); x4c(:,2); x5c(:,2)];
%Haal alle nullen eruit
xcx(xcx == 0) = [];
xcy(xcy == 0) = [];

% x1d = intersect(loc23, loc12, 'rows');
% x2d = intersect(loc23, loc13, 'rows');
% x3d = intersect(loc23, loc14, 'rows');
% x4d = intersect(loc23, loc24, 'rows');
% x5d = intersect(loc23, loc34, 'rows');
% 
% xdx = [x1d(:,1); x2d(:,1); x3d(:,1); x4d(:,1); x5d(:,1)];
% xdy = [x1d(:,2); x2d(:,2); x3d(:,2); x4d(:,2); x5d(:,2)];
% xdx(xdx == 0) = [];
% xdy(xdy == 0) = [];

ax = median(xax);
ay = median(xay);
% bx = mean(xbx);
% by = mean(xby);
cx = median(xcx);
cy = median(xcy);
% dx = mean(xdx);
% dy = mean(xdy);

%Plaats alle gemiddelden in een vector
X = [ax cx];
Y = [ay cy];
%Haal de NaN eruit (deze ontstaan als er geen zinnige waarde uitkomt
X(isnan(X)) = 0 ;
Y(isnan(Y)) = 0 ;

%Bereken hier het gemiddelde (of de mediaan)
x = mean(X);
y = mean(Y);
end

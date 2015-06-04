function  dir = nav(car, carp, target)
global DEBUG;
global dirRight;
global dirLeft;
global dirNeutral;

% getOrientation(car(1), ycar, xcarp, ycarp);
HDG = getOrientation(car(1),car(2),carp(1),carp(2));
HDG = HDG/(2*pi) * 360;
atarget = getOrientation(car(1), car(2), target(1), target(2));
atarget = atarget/(2*pi) * 360;

if(DEBUG)
disp('HDG =');
disp(HDG);
disp('Angle =');
disp(atarget);
end

if( HDG - atarget > 180 )
    dir = dirLeft;
elseif( HDG - atarget > 0 )
    dir = dirRight;
elseif( HDG - atarget < 0 )
    dir = dirLeft;
elseif( HDG - target == 0)
    dir = dirNeutral;
end
end
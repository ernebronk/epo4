function angle =  getOrientation(xcar, ycar, xcarp, ycarp)
dx = xcarp - xcar;
dy = ycarp - ycar;
angle = atan2(dx,dy);
end
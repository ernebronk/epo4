function angle =  getOrientation(x1, y1, x2, y2)
dx = x2 - x1;
dy = y2 - y1;
angle = atan2(dx,dy);
end
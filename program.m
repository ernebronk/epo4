
constants;

% First connect to the car;
% 
carconnect(COM_PORT);


   
% Check if charge is ok
cstate = 0;
while(cstate == 0)
    battery = status();
    if(battery > minBat)
        cstate = 1;
        logboek{n,2} = carposp(1);
        logboek{n,3} = carposp(2);
    else
        cstate = 0;
        n = n + 1;
    end  
    logboek{n,1} = toc;
    disp('Batceck');
end

disp('HOI');
while(state < 900)
    if(abs(carpos(1) - target(1)) < res && abs(carpos(2) - target(2)) < res)
        speed = 150;
        state = 900;
    else
            disp('hooi');
        speed = fwdSpeed;
    end

    % Get the position
    
    [loc12 loc13 loc14 loc23 loc24 loc34] = matchgrid(xsize, ysize, div, rafstand12, rafstand13, rafstand14, rafstand23, rafstand24, rafstand34, r12, r13, r14, r23, r24, r34, xmax, ymax);
    [xp1 xp2 xp3 xp4 xp5] = locatie(loc12, loc13, loc14, loc23, loc24, loc34, xsize, ysize, div);

    
    % EO
    status();
    dir = nav(carpos,carposp,target);
    
    %send the data
    send(dir,speed);
    logboek{n,1} = toc;
    n = n + 1;
    pause(DELAY);
    
    logboek{n,2} = carpos(1);
    logboek{n,3} = carpos(2);
    %carposp = carpos;
    logboek{n,5} = speed;
    logboek{n,6} = dir;
    
end




% Clearing all the things

EPOCommunications('close');

name = '';
for n = 1:6
    x = t(n);
    name = [name '_' num2str(x)];
end
name = ['logs/' name '.mat'];
save(name);

close all;


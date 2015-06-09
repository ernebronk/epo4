
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
    
    % Target 1
    if(abs(carpos(1) - target1(1)) < res && abs(carpos(2) - target1(2)) < res && state ~= 450)
        speed = 150;
        state = 450;
        pause(2)
    else
        speed = fwdSpeed;
        target = target1;
    end
    
    if(abs(carpos(1) - target2(1)) < res && abs(carpos(2) - target2(2)) < res && state == 450)
        speed = 150;
        state = 900;
    else
        speed = fwdSpeed;
        target = target2;
    end

    % Get the position
    carpos = [ 5 10];
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
    logboek{n,7} = state;
    
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


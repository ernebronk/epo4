
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
    disp(battery);
end

while(state < 900)
    %--------------- Stage 1 --------------
    %-- Check if car is at target ---------
    %--------------------------------------
    disp(' ');
    disp(['STEP ' num2str(n)]);
    % Target 1
%     if(abs(carpos(1) - target1(1)) < res && abs(carpos(2) - target1(2)) < res && state ~= 450)
%         speed = 150;
%         state = 450;
%         pause(2)
%     else
%         speed = fwdSpeed;
%         speed = 150;
%         target = target1;
%     end
%     
%     if(abs(carpos(1) - target2(1)) < res && abs(carpos(2) - target2(2)) < res && state == 450)
%         speed = 150;
%         state = 900;
%     else
%         speed = fwdSpeed;
%         target = target2;
%     end

target = target1;

    %--------------- Stage 2 --------------
    %-- Get the posision of the car -------
    %--------------------------------------  
    [carpos(1) carpos(2)] = loctdo();
    
    % Update position in GUI
    gui.xpos.String = [gui.data.names.xpos num2str(carpos(1))];
    gui.ypos.String = [gui.data.names.ypos num2str(carpos(2))];

    dsp = ['X' num2str(carpos(1)) ' Y' num2str(carpos(2))];
    disp(dsp);
    % EO
    status();
    dir = nav(carpos,carposp,target);
    
    % send the data
    send(dir,speed);
    % Wait a moment
    pause(DELAY2);
    % Send stop
    send(dir,150);
    
    
    %Write LOG
    n = n + 1;
    logboek{n,1} = toc;
    logboek{n,2} = carpos(1);
    logboek{n,3} = carpos(2);
    logboek{n,5} = speed;
    logboek{n,6} = dir;
    logboek{n,7} = state;
    if (carpos ~= carposp)
    carposp = carpos;
    end
    
    pause(DELAY1);
end




% Clearing all the things
if(LIVE)
    EPOCommunications('close');
else
    EPOCommunications1('close');
end
name = '';
for n = 1:6
    x = t(n);
    name = [name '_' num2str(x)];
end
name = ['logs/' name '.mat'];
save(name);

close all;


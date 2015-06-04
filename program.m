
constants;

% First connect to the car;
% 
%carconnect(COM_PORT);


    
% Check if charge is ok
cstate = 0;
while(cstate == 0)
    battery = status();
    if(battery > minBat)
        cstate = 1;
    else
        cstate = 0;
    end  
    logboek{n,1} = toc;
    n = n + 1;
    disp('Batceck');
end

while(state < 900)
    % Get the position
    status();
    speed = fwdSpeed;
    dir = nav(carpos,carposp,target);
    %send the data
    
    if(abs(carpos(1) - target(1)) < res && abs(carpos(2) - carposp(2) < res))
        state = 900;
    end
    %send(dir,speed);
    logboek{n,1} = toc;
    n = n + 1;
end

EPOComminucations('close');


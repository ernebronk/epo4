    
while(1)
    pause(0.5)
    pos(1) = ceil(n*rand(1)/2);
    pos(2) = ceil(n*rand(1)/2)';
    disp(pos)
    save('pos.mat','pos')
end
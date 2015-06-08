function [loc12 loc13 loc14 loc23 loc24 loc34] = matchgrid(xsize, ysize, div, rafstand12, rafstand13, rafstand14, rafstand23, rafstand24, rafstand34, r12, r13, r14, r23, r24, r34, xmax, ymax)
    
%Input
% xsize, ysize, div, rafstand12, rafstand13, rafstand14, rafstand23, rafstand24, rafstand34, r12, r13, r14, 23, r24, r34

%output
% loc12 loc13 loc14 loc23 loc24 loc34

rmarge12 = div;
rmarge13 = div;
rmarge14 = div;
rmarge23 = div;
rmarge24 = div;
rmarge34 = div;

%X en Y loop maken
%Hier wordt de grote van de rij matrix bepaald
xloop = 1:xsize:xmax;
yloop = 1:ysize:ymax;

%--------------------------Matchpunten berekenen
%Matchpunten 12
k = 1;
for y=1:length(yloop)
    for x=1:length(xloop)
        if( (rafstand12 - rmarge12) < r12(y,x) && r12(y,x) < (rafstand12 + rmarge12))
%             locatie(y,x) = 1;
            locx12(k) = x*xsize;  
            locy12(k) = y*ysize;
            k = k +1;
        else
%              locatie(y,x) = 0;
            locx12(k) = 0;
            locy12(k) = 0;
            k=k+1;
        end 
    end
end
clear k x y

%Matchpunten 13
k = 1;
for y=1:length(yloop)
    for x=1:length(xloop)
        if( (rafstand13 - rmarge13) < r13(y,x) && r13(y,x) < (rafstand13 + rmarge13))
%             locatie(y,x) = 1;
            locx13(k) = x*xsize;  
            locy13(k) = y*ysize;
            k = k +1;
        else
%              locatie(y,x) = 0;
            locx13(k) = 0;
            locy13(k) = 0;
            k=k+1;
        end 
    end
end
clear k x y


%Matchpunten 14
k = 1;
for y=1:length(yloop)
    for x=1:length(xloop)
        if( (rafstand14 - rmarge14) < r14(y,x) && r14(y,x) < (rafstand14 + rmarge14))
%             locatie(y,x) = 1;            
            locx14(k) = x*xsize;
            locy14(k) = y*ysize;
            k = k +1;
        else
%              locatie(y,x) = 0;
            locx14(k) = 0;
            locy14(k) = 0;
            k=k+1;
        end 
    end
end
clear k x y

%Matchpunten 23
k = 1;
for y=1:length(yloop)
    for x=1:length(xloop)
        if( (rafstand23 - rmarge23) < r23(y,x) && r23(y,x) < (rafstand23 + rmarge23))
%             locatie(y,x) = 1;         
            locx23(k) = x*xsize;
            locy23(k) = y*ysize;
            k = k +1;
        else
%              locatie(y,x) = 0;
            locx23(k) = 0;
            locy23(k) = 0;
            k=k+1;
        end 
    end
end
clear k x y


%Matchpunten 24
k = 1;
for y=1:length(yloop)
    for x=1:length(xloop)
        if( (rafstand24 - rmarge24) < r24(y,x) && r24(y,x) < (rafstand24 + rmarge24))
%             locatie(y,x) = 1;         
            locx24(k) = x*xsize;
            locy24(k) = y*ysize;
            k = k +1;
        else
%              locatie(y,x) = 0;
            locx24(k) = 0;
            locy24(k) = 0;
            k=k+1;
        end 
    end
end
clear k x y

%Matchpunten 34
k = 1;
for y=1:length(yloop)
    for x=1:length(xloop)
        if( (rafstand34 - rmarge34) < r34(y,x) && r34(y,x) < (rafstand34 + rmarge34))
%             locatie(y,x) = 1;         
            locx34(k) = x*xsize;
            locy34(k) = y*ysize;
            k = k +1;
        else
%              locatie(y,x) = 0;
            locx34(k) = 0;
            locy34(k) = 0;
            k=k+1;
        end 
    end
end
clear k x y

loc12=[locx12 ; locy12];
loc13=[locx13 ; locy13];
loc14=[locx14 ; locy14];
loc23=[locx23 ; locy23];
loc24=[locx24 ; locy24];
loc34=[locx34 ; locy34];

clear locx12
clear locx13
clear locx14
clear locx23
clear locx24
clear locx34

clear locy12
clear locy13
clear locy14
clear locy23
clear locy24
clear locy34




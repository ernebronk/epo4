function result = carconnect(com_txt)


com_txt = num2str(com_txt);
%Comport naam bouwen
comname = ['\\.\COM' com_txt];

%Open de connectie
result = EPOCommunications('open',comname);

%Kijken of het gelukt is om een connectie te maken
if result==0
    disp('Het is stuk. Probeer het volgende: herstart matlab');
    disp('Werkt dit niet, verwijder het device (de auto: RD3224) uit device manager en herinstalleer de auto vervolgens.');
    disp('Werkt dit ook niet, reset de blutooth jetser op de auto en voer alle bovenstaande stappen uit');
    disp('Werkt dit ook niet, herstart de pc, laadt de Supercaps opnieuw op, verwijder alle blutooth connecties en voer bovenstaande stappen uit.')
end; %end if

end %end functie


function status = EPOCommunications1(A,B)

if(strcmp(A,'open'))
    disp('COM Open');
    status = 1;
elseif(strcmp(A,'transmit') && strcmp(B,'S'))
    status = 'D150 150 U999 999 A 18874 Audio 0';
end


end
function [mic] = datagen(meting)
load audiodata13.mat %load measured data
for i=1:5
    mic(i,:)=RXXr(meting,:,i);
end
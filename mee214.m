clc;
clear;
angle=[0:0.0001:90];
Ms=[0.4,0.5,0.6];
Mk=0.4;
g=9.81;
at = 1.5;
m=70;
j=0;
%%%%%%%%%%%%%program%%%%%%
f=(m*g*sin(angle*pi/180))-(m*at);
fk=(Mk*g*m*cos(angle*pi/180))-((Mk*m*30*(angle*pi/180))/10);
for i = 1:3
     fsmax{i}=(Ms(i)*m*g*cos(angle*pi/180))-((Ms(i)*m*30*(angle*pi/180))/10);
     insec(i,:,1)=find(abs(fsmax{i}-f)<=0.001);
     fdome(1:insec(i,2))=fsmax{i}(1:insec(i,2));
     fdome(insec(i,2)+1:900001)=fk(insec(i,2)+1:900001);
     show{i}=fdome;
end
N=(m*g*cos(angle*pi/180))-((m*30*(angle*pi/180))/10);
N0=find(abs(N)<0.001);
subplot(4,1,1);
plot(angle,show{1},angle,f); xlabel('angle'); ylabel('force'); title(['Plot F and Fmax Us=',num2str(Ms(1)),' Fsmax=26.88' ])
subplot(4,1,2);
plot(angle,show{2},angle,f); xlabel('angle'); ylabel('force'); title(['Plot F and Fmax Us=',num2str(Ms(1)),' Fsmax=30.265' ])
subplot(4,1,3);
plot(angle,show{3},angle,f); xlabel('angle'); ylabel('force'); title(['Plot F and Fmax Us=',num2str(Ms(1)),' Fsmax=33.247' ])
subplot(4,1,4);
plot(angle,N); xlabel('angle'); ylabel('force'); title(['Normal',num2str(N0)])
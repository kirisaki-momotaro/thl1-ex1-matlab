clear all
close all


T=16;


%theta 1
phi=zeros(1,3*T); %init function
phi(1:T/2)=1/sqrt(T); %define function

[theta_1,time]=xcorr(phi); %this returns the autocorrelation graph
figure(1)
subplot(3,1,1);
plot(time,theta_1);
grid on;
title(['theta 1 , T = ' num2str(T)])
%theta 2
phi_2=zeros(1,3*T);
phi_2(1:T/2)=1/sqrt(T);
phi_2 =[zeros(1,2) phi_2];
phi_2 = phi_2(1:end-2);
subplot(3,1,2);
[theta_2,time]=xcorr(phi_2);
plot(time,theta_2);
grid on;
title(['theta 2 , T = ' num2str(T)])


%theta 3
phi_3=zeros(1,3*T);
phi_3(1:T/2)=1/sqrt(T);
phi_3(T/2+1:T)=-(1/sqrt(T));
subplot(3,1,3);
[theta_3,time]=xcorr(phi_3)
plot(time,theta_3);
grid on;
title(['theta 3 , T = ' num2str(T)])


clear all
close all


T=0.001;
over=10;
Ts=T/over;
A=4; 

%B
%plot SRRC with a=0,0.5,1
[phi_0, t] = srrc_pulse(T, over, A, 0);
[phi_0_5, t] = srrc_pulse(T, over, A, 0.5);
[phi_1, t] = srrc_pulse(T, over, A, 1);

%array to store integrals of autocorrelation
autocorrelation_integrals =zeros(12,1);

for k=0:3
    

    % create array of n zeros and concatenate with function
    phi_0_shifted = [zeros(1,k*T*(1/Ts)), phi_0(1:end-k*T*(1/Ts))];
    

    if k<=2
        figure()
        subplot(2,1,1) 
        % plot the original and shifted functions

        plot(t, phi_0,t, phi_0_shifted)
        str = sprintf('k=%d , a=0',k);
        title(str);
        grid on;
        subplot(2,1,2) 
        plot(t, phi_0.*phi_0_shifted)
        grid on;
    end
    %approximate integrals through the use of sum
    autocorrelation_integrals(k+1)= Ts*sum(phi_0.*phi_0_shifted);

end

for k=0:3
    
    % create array of n zeros and concatenate with function
    phi_0_5_shifted = [zeros(1,k*T*(1/Ts)), phi_0_5(1:end-k*T*(1/Ts))];


    if k<=2
        figure()
        subplot(2,1,1) 

        % plot the original and shifted functions

        plot(t, phi_0_5,t, phi_0_5_shifted)
        str = sprintf('k=%d , a=0.5',k);
        title(str);
        grid on;
        subplot(2,1,2) 
        plot(t, phi_0_5.*phi_0_5_shifted)
        grid on;
    end
    %approximate integrals through the use of sum
    autocorrelation_integrals(k+5)= Ts*sum(phi_0_5.*phi_0_5_shifted);

end

for k=0:3
   
    

    % create array of n zeros and concatenate with function
    phi_1_shifted = [zeros(1,k*T*(1/Ts)), phi_1(1:end-k*T*(1/Ts))];


    if k<=2
        figure()
        subplot(2,1,1) 
    % plot the original and shifted functions

        plot(t, phi_1,t, phi_1_shifted)
        str = sprintf('k=%d , a=1',k);
        title(str);

        grid on;
        subplot(2,1,2) 
        plot(t, phi_1.*phi_1_shifted)
        grid on;
    end
    %approximate integrals through the use of sum
    autocorrelation_integrals(k+9)= Ts*sum(phi_1.*phi_1_shifted);
    

end
autocorrelation_integrals



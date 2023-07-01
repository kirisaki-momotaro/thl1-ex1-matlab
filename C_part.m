clear all
close all

T=0.001;
over=10;
Ts=T/over;
A=4; 

N=50;
b = (sign(randn(N, 1)) + 1)/2;
X = bits_to_2PAM(b);

X_delta = 1/Ts * upsample(X, over);
figure(1)
%X_delta_time = 0:N*over-1;
X_delta_time = 0:Ts:N*Ts*over-Ts;
plot(X_delta_time,X_delta);
grid on;
title('original signal')


% we choose a = 0.5 for minimal bandwidth
[phi_0_5, t] = srrc_pulse(T, over, A, 0.5);

%create signal to be sent by sender
signal = conv(X_delta,phi_0_5)*Ts;
%signal_t = linspace(X_delta_time(1)+t(1),X_delta_time(length(X_delta_time))+t(length(t)),length(signal));
signal_t = [X_delta_time(1)+t(1):Ts:X_delta_time(end)+t(end)];
figure(2)
plot(signal_t,signal);
grid on;
title('modulated signal')

%recreate original signal
recreated_signal = conv(signal,phi_0_5)*Ts;
%recreated_signal_t = linspace(signal_t(1)+t(1),signal_t(length(signal_t))+t(length(t)),length(recreated_signal));
recreated_signal_t = [signal_t(1)+t(1):Ts:signal_t(end)+t(end)];
figure(3)
plot(recreated_signal_t,recreated_signal);
grid on;
title('recreated signal')

%recreate symbols by sampling
figure(4)
recreated_symbols_sample = zeros(length(recreated_signal_t),1);
recreated_symbols_sample(1 :over:length(recreated_symbols_sample)) = 1;
recreated_symbols=recreated_symbols_sample.*recreated_signal
plot(recreated_signal_t,recreated_symbols)
grid on;
title('recreated symbols')

%coplot recreated signal with original signal
figure(5)
plot(recreated_signal_t,recreated_signal);
title('coplot recreated signal with original signal')
hold on
%figure(6)
stem([0:N-1]*T,X);
grid on

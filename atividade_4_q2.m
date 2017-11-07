%questao 2
close all
clear
Ts = .02;
T = 2;
t = 0:Ts:T-Ts;
a = 1;
ftriangulo = a.*t - ((2*a.*t.*heaviside(t-1)))+2*heaviside(t-1) ;
N = T/Ts;
stem(t,ftriangulo);
n = 0:1:N-1;
fft_triang = fft(ftriangulo);
figure;
%plot(n,fft_triang);
X = fftshift(fft_triang);
plot(abs(X))


plot(sin(n))

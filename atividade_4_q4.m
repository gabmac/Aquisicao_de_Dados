%questao 4
close all 
clear all
clc

n = 0:0.256:256-0.256;

T = 0.256;

W1= 100*2*pi;
W2 = 110*2*pi;

w1 = W1*T;
w2 = W2*T;

k1 = -3;
k2 = 20*log(0.05);


%o tipo de janela escolhido foi Hanning

%N = 8*pi/(w2-w1) N = 1.5625

N = 3;


a = (N-1)/2;

wc = w1;

hd = hdn(wc,n,a);

Wn = hanning(n,N);

hn = hd.*Wn;
 
xn = cos(200*pi.*n)+cos(220*pi.*n);
 

fft_suprema = fft(xn).*fft(hn);
inversefft = ifft(fft_suprema);

plot(inversefft);

transf = abs(fft(hn));

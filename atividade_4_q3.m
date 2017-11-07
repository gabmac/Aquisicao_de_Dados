close all;
clear;
clc

df = 1;
range_freq = 0:df:1023;

for i = 1:1:length(range_freq)
    if(128 < abs(range_freq(i)))
       xn(i) = 0;
    else
       xn(i) = 1;
    end
end

%stem(range_freq,xn);

dt = 1/1024;
range_tempo = range_freq.*dt;

inversefft = abs(real(length(range_freq)*df*ifft(xn)));
plot(range_tempo,inversefft)

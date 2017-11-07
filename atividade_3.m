clear 
close all;


load('music.mat');


%passabanda comeÁa em 20hz e 20khz
    T = length(audioarray);
    tfinal = 5;
    ti = 0;
    dt = tfinal/T;
t = ti:dt:tfinal-dt;
    df = 1/(length(t)*dt);
    f = (0:length(t)-1)*df;
    sinalf = abs(fft(audioarray));
    %plot(f,sinalf)
%freqcorte 20khz freq atenuaÁao 21khz
%parte 3
    loglog(f,sinalf)
    
%parte 4
    
    Wp=[1300 2400]/20000;%È o m·ximo q o humano pode ouvir
    Ws = [800 3000]/20000; % ter uma queda r·pida
    Rp = 3; %padr„o
    Rs = 40; % por causa dos polos
    [n,Wn] = buttord(Wp,Ws,Rp,Rs);
    [A,B] = butter(n,Wp,'bandpass'); %forma de estados
    
    filtrado = filter(A,B,audioarray);
    
    ffiltrado = abs(fft(filtrado));
    
    plot(f,ffiltrado);

    %parte 5
       
    Wp=[1400 1730]/20000;%È o m·ximo q o humano pode ouvir
    Ws = [900 2000]/20000; % ter uma queda r·pida
    Rp = 3; %padr„o
    Rs = 40; % por causa dos polos
    [n,Wn] = buttord(Wp,Ws,Rp,Rs)
    [A,B] = butter(n,Wp,'bandpass'); %forma de estados
    
    filtrado1 = filter(A,B,filtrado);
    
    ffiltrado1 = abs(fft(filtrado1));
    
    plot(f,ffiltrado1);
    
    %parte 5b
    
    Wp=[2000 2400]/20000;%È o m·ximo q o humano pode ouvir
    Ws = [1500 2900]/20000; % ter uma queda r·pida
    Rp = 3; %padr„o
    Rs = 40; % por causa dos polos
    [n,Wn] = buttord(Wp,Ws,Rp,Rs)
    [A,B] = butter(n,Wp,'bandpass'); %forma de estados
    
    filtrado2 = filter(A,B,filtrado);
    
    ffiltrado2 = abs(fft(filtrado2));
    
    loglog(f,ffiltrado1);
    
    
    %parte 6
     filtrado1 = filtrado1.*75; % ampop  de 75 de ganho
     filtrado2 = filtrado2.*35;
    audio = audioplayer(filtrado1,20000,16)
    %play(audio)
    audio2 =  audioplayer(filtrado2,20000,16);
    play(audio2)
    save('sinaistotais.mat') 
    %filtrado1 È o sinal para baixa frequencia
    %filtrado2 È o sinal para alta frequencia
    %filtrado È apenas o sinal j· filtrado
    %audioarray È o sinal puro
    
    

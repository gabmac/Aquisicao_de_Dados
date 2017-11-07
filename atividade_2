close all
clear
load('sinal_155416.mat');
%Observação as funções foram aberta na main para mandar no moodle
% 1 tempo  de fsk é .125 s Done
%meu numero de pontos para esse intervalo é de 1250
% 2 

[f,sinalf] = efreqfft(sinal,dt,t);
 
% 
 plot(f,abs(sinalf));


%4
    n = length(sinal)/.125*dt;     %numero de partes que preciso dividir
    tparacorte = length(sinal)/n;
    [sinalc] = vec2mat(sinal,tparacorte);
tempolc = 0:dt:.125-dt;
    for i = 1:n
        sinalcortado = copialinhamatriz(sinalc,i);
        [f,sinalf]=efreqfft(sinalcortado,dt,tempolc);
        [maxval,index] = max(abs(sinalf(1:length(sinalf))));   
        ordem(i)=f(index);
    end

 for i = 1:n
       
        switch ordem(i)
            case 56
                vetor(i) = 0;
            case 104
                vetor(i) = 1;
            case 160
                vetor(i) = 2;
            case 216
                vetor(i) = 3;
            case 272
                vetor(i) = 4;
            case 320
                vetor(i) = 5;
            case 376
                vetor(i) = 6;
            case 432
                vetor(i) = 7;
            case 488
                vetor(i) = 8;
            case 536
                vetor(i) = 9;
            case 592
                vetor(i) = 10;
            case 648
                vetor(i) = 11;
            case 704
                vetor(i) = 12;
            case 752
                vetor(i) = 13;
            case 808
                vetor(i) = 14;
            case 864
                vetor(i) = 15;
            otherwise
                vetor(i) = ordem(i);    
        end
            
 end
%5
i = 1;
j = 1;
    while i<n
      vetorbyte(j) = 16*vetor(i)+vetor(i+1);
      i = i+2;  
      j=j+1;
    end
% 6
   [char(vetorbyte)]  

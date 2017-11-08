clear 
close all

load('alcool.mat')
T = table;
T.Tempo = tempo;
T.Consumo = alcoholdemandlogspiritsconsu;

N = 6;
m = 3;
%copiou primeiro N+m termos
for i =  1: N+m+1
    Xpk(i) = T.Consumo(i);
end

for k = N+m+1 : length(alcoholdemandlogspiritsconsu);
    for i = 0:N-1
        for j = 0:m            
            if(j == m)
                M(i+1,j+1) = 1;
            else
                M(i+1,j+1)=T.Consumo(k-1-i-j);
            end
        end
    end
    %Matriz M feita
    
    for i = 0:N-1
        vk(i+1) =  T.Consumo(k-i);
    end
    vk1 = vk';
    mtran = M';
    pkest = inv((mtran)*M)*(mtran)*vk1;
    for  i = 0:m
        if (i == m)
            vm(i+1) = 1;
        else
            vm(i+1) =  T.Consumo(k-i);
        end
    end
    vmt = vm';
    pkest1 = pkest';
    Xp(k) = (pkest1)*vmt; 
    
end

%parte 3


for i = 1:length(alcoholdemandlogspiritsconsu)-1
   e(i) = (Xp(i)-T.Consumo(i))/T.Consumo(i); 
end

plot(e)
hold on
%parte 4

clear


load('alcool.mat')
T = table;
T.Tempo = tempo;
T.Consumo = alcoholdemandlogspiritsconsu;

N= 7;
m = 3;

        %copiou primeiro N+m termos
        for i =  1: N+m+1
            Xpk(i) = T.Consumo(i);
        end

        for k = N+m+1 : length(alcoholdemandlogspiritsconsu);
            for i = 0:N-1
                for j = 0:m            
                    if(j == m)
                        M(i+1,j+1) = 1;
                    else
                        M(i+1,j+1)=T.Consumo(k-1-i-j);
                    end
                end
            end
            %Matriz M feita

            for i = 0:N-1
                vk(i+1) =  T.Consumo(k-i);
            end
            vk1 = vk';
            mtran = M';
            pkest = inv((mtran)*M)*(mtran)*vk1;
            for  i = 0:m
                if (i == m)
                    vm(i+1) = 1;
                else
                    vm(i+1) =  T.Consumo(k-i);
                end
            end
            vmt = vm';
            pkest1 = pkest';
            Xp(k) = (pkest1)*vmt; 

        end


        for i = 1:length(alcoholdemandlogspiritsconsu)-1
           e2(i) = (Xp(i)-T.Consumo(i))/T.Consumo(i); 
        end


        plot(e2)
        


hold off
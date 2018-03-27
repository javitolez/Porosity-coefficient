% slek  
% This file calculates the approximate point of the SLE_k curve.
% Imputs:
% afd = browniam motion directions
% tempos = times

% Source:
% https://arxiv.org/pdf/math/0508002.pdf
% pages 1-8.
% Tom Kennedy
% Department of Mathematics University of Arizona
% Observar que en su pagina no sale su implementación esta caida la pagina.
% Toma delta_k positivo, discutir con Aislan %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function pontos=slek(afd,tempos)
npassos=5; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% revisar %%%%%%%%%%%
npontos=length(tempos);
xi=[tempos', afd'];% Tamanho (npontos X 2)

angulo= 0;
for i=2:npontos
    x = 2.*(xi(i,1)-xi(i-1,1)); %%%%%%%%%%%%%%%%%%%%%% revisar %%%%%%%%%%%%%%%%%%%%
    y = (xi(i,2)-xi(i-1,2)); %%%%%%%%%%%%%%%%%%%%%% revisar %%%%%%%%%%%%%%%%%%%%%%%
    e = 1./sqrt(y*y+8*x); %%%%%%%%%%%%%%%%%%%%%%%%% revisar %%%%%%%%%%%%%%%%%%%%%%
    a = .5*(1-y*e); %%%%%%%%%%%%%%%%%%%%%%%%%%%%%% revisar %%%%%%%%%%%%%%%%%%%%%%%%
    angulo = [angulo; a];
end

pontos=zeros(npontos,1);

for i=npontos:-1:2
    a1 = angulo(i);
    if (npontos-i) > 0
        for j=(npontos-i+2):-1:3
            z=pontos(j-1);
            pontos(j) = ((z-2*sqrt(((1/npassos)*a1)/(1-a1)))^a1)*((z+2*sqrt(((1/npassos)*(1-a1))/(a1)))^(1-a1)); %%%%%%%%%%%%% revisar %%%%%%%%%%%%%%%%%
        end
    end
    
end
        
        
       
        


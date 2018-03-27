%Código para otenção de curvas aleatórias SLEk
%Autor: Irassu Oliveira Santos

function brown=browniano3d(nparticulas,npassos)
% xp = coordenada x do poro
% yp = coordenada y do poro
% zp = coordenada z do poro
% df = dimensão fractal do contorno que contém o a coordenada do poro
% dib = dimensão da imagem binária de entrada
%% Simular movimento browniano em 3D
 % Adaptado de Vicente Torres
X=zeros(nparticulas,npassos);
Y=zeros(nparticulas,npassos);
Z=zeros(nparticulas,npassos);
for n=1:nparticulas %número de partículas em cada interação
    x=zeros(1,npassos); %vetor de posição das partículas
    y=zeros(1,npassos);
    z=zeros(1,npassos);

    %% Direção 3D aleatória - criação de 2 direções aleatórias para cobrir o espaço
    %rng(12);
    %rng('shuffle','twister')
    phi=pi*rand(1,npassos);% 1a. direção aleatória para a partícula (poro)- varia de 0 a 2pi
    theta=pi*rand(1,npassos);% 2a. direção aleatória para a partícula (poro) - varia de 0 a pi
    for i=1:npassos-1 % Interação entre partículas
        x(i+1)=round(x(i)+cos(phi(i)).*sin(theta(i)));
        y(i+1)=round(y(i)+sin(phi(i)).*sin(theta(i)));
        z(i+1)=round(z(i)+cos(theta(i)));
    end
    
    %% Armazena a trajetória de cada partícula
    X(n,:)=x;
    Y(n,:)=y;
    Z(n,:)=z;
end
%% Vetores de Trajetórias em x e em y
brown(:,:,1)=X;
brown(:,:,2)=Y;
brown(:,:,3)=Z;

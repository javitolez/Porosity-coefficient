%C�digo para oten��o de curvas aleat�rias SLEk
%Autor: Irassu Oliveira Santos

function brown=browniano3d(nparticulas,npassos)
% xp = coordenada x do poro
% yp = coordenada y do poro
% zp = coordenada z do poro
% df = dimens�o fractal do contorno que cont�m o a coordenada do poro
% dib = dimens�o da imagem bin�ria de entrada
%% Simular movimento browniano em 3D
 % Adaptado de Vicente Torres
X=zeros(nparticulas,npassos);
Y=zeros(nparticulas,npassos);
Z=zeros(nparticulas,npassos);
for n=1:nparticulas %n�mero de part�culas em cada intera��o
    x=zeros(1,npassos); %vetor de posi��o das part�culas
    y=zeros(1,npassos);
    z=zeros(1,npassos);

    %% Dire��o 3D aleat�ria - cria��o de 2 dire��es aleat�rias para cobrir o espa�o
    %rng(12);
    %rng('shuffle','twister')
    phi=pi*rand(1,npassos);% 1a. dire��o aleat�ria para a part�cula (poro)- varia de 0 a 2pi
    theta=pi*rand(1,npassos);% 2a. dire��o aleat�ria para a part�cula (poro) - varia de 0 a pi
    for i=1:npassos-1 % Intera��o entre part�culas
        x(i+1)=round(x(i)+cos(phi(i)).*sin(theta(i)));
        y(i+1)=round(y(i)+sin(phi(i)).*sin(theta(i)));
        z(i+1)=round(z(i)+cos(theta(i)));
    end
    
    %% Armazena a trajet�ria de cada part�cula
    X(n,:)=x;
    Y(n,:)=y;
    Z(n,:)=z;
end
%% Vetores de Trajet�rias em x e em y
brown(:,:,1)=X;
brown(:,:,2)=Y;
brown(:,:,3)=Z;

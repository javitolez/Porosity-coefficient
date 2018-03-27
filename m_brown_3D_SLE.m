%% Simular SLE em 3D
 % Adaptado de Vicente Torres
clear
close all
clc
nparticulas=1; % número de particulas,
npassos=2000;%Número de pontos
X=zeros(nparticulas,npassos);
Y=zeros(nparticulas,npassos);
Z=zeros(nparticulas,npassos);

for n=1:nparticulas %número de particulas em cada interação
    x=zeros(1,npassos); %vetor de posição das partículas
    y=zeros(1,npassos);
    z=zeros(1,npassos);

%% Direção 3D aleatória - criação de 2 direções aleatórios para cobrir o espaço
% Utilização de coordenadas cilíndricas
    rng('shuffle','v5uniform');
    phi=pi*rand(1,npassos);% 1a. direção aleatória para a partícula - 0 a pi
    theta=pi*rand(1,npassos);% 2a. direção aleatória para a partícula - 0 a pi
    for i=1:npassos-1 % Interação entre partículas
        x(i+1)=abs(x(i)+cos(phi(i)).*sin(theta(i)));
        y(i+1)=abs(y(i)+sin(phi(i)).*sin(theta(i)));
        z(i+1)=abs(z(i)+cos(theta(i)));
    end
    %% Armazena a trajetória de cada partícula
    X(n,:)=round(x);
    Y(n,:)=round(y);
    Z(n,:)=round(z);
end

%% Plota a trajetória das partículas no movimento browniano
hold on
for n=1:nparticulas;
    plot3(X(n,:),Y(n,:),Z(n,:));
end
title ('Movimento Browniano')
view(3);
axis tight
box on
hold off

%% GERA CURVAG SLE
df=1.2;
X(1)=5;
Y(1)=10;
Z(1)=1;
for n=1:nparticulas
   pontos(n,:)=ssle(X(n,:),npassos,df);
   xx(n,:)=real(pontos(n,:));
   xy(n,:)=imag(pontos(n,:));
   pontos(n,:)=ssle(Y(n,:),npassos,df);
   yx(n,:)=real(pontos(n,:));
   yy(n,:)=imag(pontos(n,:));
   pontos(n,:)=ssle(Z(n,:),npassos,df);
   zx(n,:)=real(pontos(n,:));
   zy(n,:)=imag(pontos(n,:));
end


%figure,
%hold on
% Inverte coordenadas para exibir na mesma escala do movimento browniano
% Para inverter fazer x1=y e y1=x
x1=xx;
y1=yx;
z1=zx;


%% Normaliza as coordenadas para o intervalo do número de coordenadas N x M na imagem
% N=M=500 - valor minimo = 1 e valor maximo = 500
% N X M = 250000
N=640;
M=420;
NM=100;%Número de fatias - a curva SLE intercepta cada fatia em uma coordenada z
intervaloxx=N-1;
intervaloyy=M-1;
intervalozz=NM-1;

% Normaliza inicialmente para o intervalo [0 1]
for n=1: nparticulas
    maxx(n,:)=max(x1(n,:));
    minx(n,:)=min(x1(n,:));
    maxy(n,:)=max(y1(n,:));
    miny(n,:)=min(y1(n,:));
    maxz(n,:)=max(z1(n,:));
    minz(n,:)=min(z1(n,:));
    intervalox(n,:)=maxx(n,:)-minx(n,:);
    intervaloy(n,:)=maxy(n,:)-miny(n,:);
    intervaloz(n,:)=maxz(n,:)-minz(n,:);
    x1(n,:)=(x1(n,:)-minx(n,:))/intervalox(n,:);
    y1(n,:)=(y1(n,:)-miny(n,:))/intervaloy(n,:);
    z1(n,:)=(z1(n,:)-minz(n,:))/intervaloz(n,:);
    
end

% Fianalmente normaliza para um intervalo qualquer [ x y] - no caso das
% coordenadas na matriz que representa a imagem
for n=1:nparticulas
    x1(n,:)=round(abs((x1(n,:)*intervaloxx)+1));
    y1(n,:)=round(abs((y1(n,:)*intervaloyy)+1));
    z1(n,:)=round(abs((z1(n,:)*intervalozz)+1));
end

%% Plota a Curva SLE 3D

figure,
hold on
plot3 ( x1(1,1), y1(1,1),z1(1,1), 'g.', 'MarkerSize', 15 );
for n=1:nparticulas;
    plot3(x1(n,:),y1(n,:),z1(n,:));
end
plot3( x1(1,npassos), y1(1,npassos),z1(1,npassos), 'b.', 'MarkerSize', 15 );
title ('Curva SLE dirigida em X, Y e Z - Normalizado para a dimensão da Imagem')
view(3);
axis tight
box on
hold off

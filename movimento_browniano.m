%% Movimento Browniano
% Autor: Irassu Oliveira Santos

%{
Parâmetros:
dmb = dimensão 1, 2 ou 3
npassos = número de passos + 1
d = coeficiente de difusão (default = 5.0)
t = tempo total (default 1.0)
x(m,n) - matriz com as posições da partícula -  posição inicial 0.0
com posições sucessivas n-1
%}

function [x,dx] = movimento_browniano(dmb,npassos,d,t)
dt = t / ( npassos - 1 );
rng('shuffle','twister');
%  Cálculo de cada passo

x = zeros ( dmb, npassos );

s =sqrt ( d * dt ) * randn ( 1, npassos - 1 );

%  Direção aleatória

if ( dmb == 1 )
   dx(1:dmb,1:npassos-1) = s(1:npassos-1);
else
   a = randn ( dmb, npassos - 1 );
   v = s ./ sqrt ( sum ( a.^2 ) );
   b = spdiags ( v', 0, npassos-1, npassos-1 );
   dx(1:dmb,1:npassos-1) = a * b;
end

% Posição atual e o somatório das posições anteriores

% Posição inicial em (0,0)
x(1:dmb,2:npassos) = cumsum ( dx(1:dmb,1:npassos-1), 2 );

% Posição inicial diferente de (0,0)
%x(1:dmb,2:npassos) = cumsum ( dx(1:dmb,1:npassos-1), 2 );

%for i=1:2
%    for j=1:100
%        x(i,j)=4;
%    end
%end
    

return
end

%% Exibe simula��o de movimento browniano
% Autor: Irassu Oliveira Santos


%{
Par�metros:
dmb = dimens�o 1, 2 ou 3
npassos = n�mero de passos + 1
d = coeficiente de difus�o (default = 10.0)
t = tempo total (default 1.0)
x(m,n) - matriz com as posi��es da part�cula -  posi��o inicial 0.0
com posi��es sucessivas n-1
%}

function exibe_movimento_browniano( dmb, npassos, x )
if ( dmb == 1 )
  y(1,1:npassos) = ( 0 : npassos - 1 ) / ( npassos - 1 );
  clf
  hold on
  plot ( x(1,:), y(1,:), 'Color', 'r', 'LineWidth', 1 )
  plot ( x(1,1), y(1,1), 'g.', 'MarkerSize', 15 );
  % Formata coordenadas do ponto inical para exibir
  xistring= sprintf('%2.2f',x(1,1));
  yistring= sprintf('%2.2f',y(1,1));
  text(x(1,1),y(1,1),xistring,'FontSize',12);
  text(x(1,1),y(1,5),yistring,'FontSize',12);
  plot (x(1,npassos), y(1,npassos), 'b.', 'MarkerSize', 15 );
  % Formata coordenadas do ponto final para exibir
  xfstring= sprintf('%2.2f',x(1,1));
  yfstring= sprintf('%2.2f',y(1,1));
  text(x(1,1),y(1,1),xfstring,'FontSize',12);
  text(x(1,1),y(1,5),yfstring,'FontSize',12);
  grid on
  xlabel ('X')
  ylabel ('Tempo')
  title ('Simula��o de Movimento Browniano em 1 dimens�o')
  hold off
elseif ( dmb == 2 )
  clf
  hold on
  plot ( x(1,:), x(2,:), 'Color', 'r', 'LineWidth', 1)
  plot ( x(1,1), x(2,1), 'g.', 'MarkerSize', 15 );
  plot ( x(1,npassos), x(2,npassos), 'b.', 'MarkerSize', 15 );
  grid on
  xlabel ('X')
  ylabel ('Y')
  title ('Simula��o de Movimento Browniano em 2 dimens�es');
  axis equal
  hold off
elseif ( dmb == 3 )
  clf
  hold on
  plot3 ( x(1,:), x(2,:), x(3,:), 'Color', 'r', 'LineWidth', 1 )
  plot3 ( x(1,1), x(2,1), x(3,1), 'g.', 'MarkerSize', 15 );
  plot3 ( x(1,npassos), x(2,npassos), x(3,npassos), 'b.', 'MarkerSize', 15 );
  grid on
  xlabel ('X')
  ylabel ('Y')
  zlabel ('Z')
  title ('Simula��o de Movimento Browniano em 3 dimens�es');
  axis equal
  view ( 3 )
  hold off
end


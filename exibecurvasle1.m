%Universidade Federal do Rio Grande do Norte
%Departamento de Inform�tica e Matem�tica Aplicada
%Programa de P�s-Gradua��o em Sistemas e computa��o
%Autor: Irassu Oliveira Santos
%% Exibe curva SLE
%{
Par�metros:
dmb = dimens�oo do movimento browniano
npassos = n�mero de passos
%}

function exibecurvasle1( dmb, npassos, pontos )

 if ( dmb == 1 )
  clf
  hold on
  y=imag(pontos);
  y=abs(y);
  x=real(pontos);
  %x=abs(x);
  plot ( x,y, 'Color', 'r', 'LineWidth', 1 )
  plot ( x(1,1), y(1,1), 'g.', 'MarkerSize', 15 );
  % Formata coordenadas do ponto inical para exibir
  xistring= sprintf('%2.2f',x(1,1));
  yistring= sprintf('%2.2f',y(1,1));
  text(x(1,1),y(1,1),xistring,'FontSize',12);
  text(x(1,1),y(1,5),yistring,'FontSize',12);
  plot ( x(1,npassos), y(1,npassos), 'b.', 'MarkerSize', 15 );
  % Formata coordenadas do ponto inical para exibir
  xfstring= sprintf('%2.2f',x(1,1));
  yfstring= sprintf('%2.2f',y(1,npassos));
  text(x(1,1),y(1,1),xfstring,'FontSize',12);
  text(x(1,1),y(1,5),yfstring,'FontSize',12);
  grid on
  xlabel ('X')
  ylabel ('Y')
  title ('Curva SLE dirigida por Movimento Browniano')
  hold off
end
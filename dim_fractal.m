%Universidade Federal do Rio Grande do Norte
%Departamento de Informática e Matemática Aplicada
%Programa de Pós-Graduação em Sistemas e computação
%Autor: Irassu Oliveira Santos
% Função para determinar a dimensão fractal
% B -> Matriz com contornos

function dimfrac=dim_fractal(B,L)
%% Determina a área dos objetos e exibe - parâmetros para a dimensão fractal
stats_area = regionprops(L,'Area','Centroid');
stats_perimetro = regionprops(L,'perimeter');

%% Contorno em volta da fronteira
np=length(B);
for k = 1:np
  
  % calcula coordenadas (X,Y) de fronteira correspondente ao rótulo 'k'
  boundary = B{k};

  % calculo do perâmetro de cada área de poro
  delta_sq = diff(boundary);%Calcula a diferença entre elementos adjacentes na fronteira
  perimetro = sum(sqrt(sum(delta_sq,2)));
  %perimetro = stats_perimetro(k).Perimeter
  if (perimetro==0) || (perimetro==1)
      perimetro=1.5;
  end 
  
  area = stats_area(k).Area;
  if (area==0) || (area==1)
      area=1.5;
  end
  
 
  
  % Cálculo da dimensão fractal com base no Método de Lovejoy
  D = abs(2*((log(perimetro))/log(area)));
  
  D_string = sprintf('%2.2f',D);
  Df(k)=D;% Vetor que guarda os valores de dimensão fractal de cada área de poro
  %text(boundary(1,2),boundary(1,1),D_string,'Color','g','FontSize',10,'FontWeight','bold');
  df=str2num(D_string);
  dimfrac(k,1)=k;
  dimfrac(k,2)=df;
end


  

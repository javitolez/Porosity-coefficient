% fractal_dimension
% Calculates the fractal dimension of each pores
% Source:
% Area-Perimeter Relation for Rain and Cloud Areas_Science-1982-LOVEJOY-185-7

function dimfrac=fractal_dimension(B,L)
stats_area = regionprops(L,'Area','Centroid');
np=length(B);
for k = 1:np
  boundary = B{k};

  % calculo do perâmetro de cada área de poro
  delta_sq = diff(boundary);%Calcula a diferença entre elementos adjacentes na fronteira
  perimetro = sum(sqrt(sum(delta_sq,2)));
  %perimetro = stats_perimetro(k).Perimeter
  if (perimetro==0) || (perimetro==1) %%%%%%%%%%%%%%%%%%%%% revisar esto %%%%%%%%%%%%%%%%%%
      perimetro=1.5;
  end 
  
  area = stats_area(k).Area; %%%%%%%%%%%%%%%%%%%%% revisar esto %%%%%%%%%%%%%%%%%%
  if (area==0) || (area==1)
      area=1.5;
  end
    
  D = abs(2*((log(perimetro))/log(area)));
  
  D_string = sprintf('%2.2f',D);
  df=str2num(D_string);
  dimfrac(k,1)=k;
  dimfrac(k,2)=df;
end


  

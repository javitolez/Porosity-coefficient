% Principal_code
% Objetive : Calculate the porosity index from a image sample

image_segmentation; % This file segment de image whit the k-means algorithm

t = cputime;% star cpu time

[lb,cb]=size(L);


sizeB=length(B);
Breduc=cell(sizeB,1);

% Reduced the number of points of each pore using the reducem Matlab function 
fr=3.0;% reduction factor
for i=1:sizeB
    i;%%%%%%%%%%%%%%%%%%%%%%%%%%%
    B1=B{i};
    B1;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    [fB1,cB2] = size (B1);%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    [Bxreduc,Byreduc] = reducem(B1(:,1),B1(:,2),fr);
    size (Bxreduc);%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    find1 =(min(Bxreduc)); %%%%%%%%%%%%%%%%%% correguir %%%%%%%%%%%%%%%%%%%%%
    if (size (Bxreduc) ~= 0)%%%%%%%%%%%
    %%%%%%%%% encontrar el valor que se hace cero %%%%%%%%%%%%%%%% 
    %%%%%%%%%%%%%%
    %pause%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %pause
    B2(:,1)=Bxreduc;
    B2(:,2)=Byreduc;
    Breduc{i}=B2;%%%%%%%%%%;
      %if (i==23)%%%%%%%%%%%%%
       %   pause%%%%%%%%%%%
      %end%%%%%%%%%%%%%%
      i;%%%%%%%%%%%%%%%
      fB1;%%%%%%%%%%%%%%%
      size(Bxreduc);%%%%%%%%%%%%%%%%%%%
      pause;
    else %%%%%%%%%%%%%%%%%%%%%%%%%
        fB1
        i
        Breduc{i} = B1;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        pause; %%%%%%%%%%%%%%%%%
      %  i%%%%%%%%%%%%%%%%%%%%%%%%%
    end %%%%%%%%%%%%%%%%%%%%%%%%
    clear B1;
    clear B2;
    %%%%%%%%%%%%%%%%%%%%%%% guardar la matriz origina y la reducida y comparar
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end

np=sizeB;
dimfrac=fractal_dimension(B,L)% This file calculates the fractal dimension
pause
nf=80;% Number of slice
sliceporos=zeros(lb,cb,nf);

nparticulas=1;% Representa um poro
npassos=5;
ssc=cell(np,1);

% slices

for i=1:nf

tmp=i;
    for j=1:np
            b=Breduc{j};
            nb=length(b);
            [lnb,cnb]=size(b);
            df=dimfrac(j,2);
            ss=zeros(lnb,cnb);
            
            % Brownian_motion: this function calculate the browniam_motion
            dmb=1;d=5;t=50;
            xb = browniam_motion(dmb,npassos,d,t);
            yb = browniam_motion(dmb,npassos,d,t);
            
            for k=1:nb
                novascoord=slek_3d(b(k,1),b(k,2),df,xb,yb,nparticulas,npassos); % Start the calculation of SLE_k curve
                
                % new coorcinates of the pore in the upper slice.
                xp=abs(round(novascoord(1,1)));
                yp=abs(round(novascoord(1,2)));
                if xp==0
                   xp=1;
                end
                if yp==0
                   yp=1;
                end
                
                
                   sliceporos(xp,yp,i)=1;
                   
                   %Slices generation
                   ss(k,1)=xp;% Vetor spline slice  x
                   ss(k,2)=yp;% Vetor spline slice  y 
            end
            ssc{j}=ss;% Vetor with the pore region of slice i
    end
  
    spline_the_slice;
    fatia(:,:,tmp)=Icru;
    close all;
    imshow(Icru);
    title(['Slice ',num2str(tmp)]);
end

fatias=sliceporos;

% show the volumen of the pore

figure,
data=fatia;
data = smooth3(data,'box',5);
patch(isocaps(data),'FaceColor','red','EdgeColor','none');
p1 = patch(isosurface(data),'FaceColor','red','EdgeColor','none');
isonormals(data,p1)
view(3); 
axis vis3d tight
camlight left; 
colormap cool
%lighting flat
lighting gouraud
%lighting phong
%lighting none
e=cputime-t      

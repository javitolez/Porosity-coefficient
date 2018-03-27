% slek_3d
% Start the calculation of SLE_k curve

function novascoord=slek_3d(xp,yp,df,xb,yb,nparticulas,passos)

X=xb;
Y=yb;

X(1,1)=xp;
Y(1,1)=yp;

for n=1:nparticulas
   pontos(n,:)=kslek(X(n,:),passos,df);
   xx(n,:)=real(pontos(n,:));
   
   pontos(n,:)=kslek(Y(n,:),passos,df);
   yx(n,:)=real(pontos(n,:));
end


pontos(1,:)=kslek(X(1,:),passos,df);
xx(1,:)=real(pontos(1,:));
pontos(1,:)=kslek(Y(1,:),passos,df);
yx(1,:)=real(pontos(1,:));


x1=xx;
y1=yx;


novascoord(1,1)=abs(x1(1,passos));
novascoord(1,2)=abs(y1(1,passos));
novascoord(1,3)=abs(y1(1,passos)); %%%%%%%%%%%%%%%%%%%% se usa!!!! %%%%%%%%%%%%%%%%%%5




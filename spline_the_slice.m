% spline_the_slice;
% This file generate the  pore whit the spline Matlab function

figure('color','k');
ax.Box='off';
ay.Box='off';
axis off
hold on
sr=length(ssc);

for i=1:sr
    B1=ssc{i};
    n=length(B1);
    if n ~= 0
        x =B1(:,1);
        y =B1(:,2);
              
        p=plot(y,x,'k',y,x,'c*');
        fill(y,x,'w');
    end
    
end

i=get(p);
F=getframe;
Icru=flipud(F.cdata);% Inverse the image
Icru = im2bw(Icru);


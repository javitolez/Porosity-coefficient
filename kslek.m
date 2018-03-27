% kslek
% Determine the value the k of SLK_k
% Imput:
% Xmb: browniam motion matrix
% passos = number of steps

% Output:
% Dimension of the curve slek = 1 + df/8.

% Source:
% Properties of Stochastic Lowner Evolutions: Conformal Invariance, Reversibility and Numerical Simulation. Fredik Johansson.

function pontos=kslek(Xmb,passos,df)

fd=Xmb;
npassos=passos;
tempos =0:npassos-1;
k=8*(df-1);
fd=sqrt(k)*fd;
pontos=slek(fd,tempos);

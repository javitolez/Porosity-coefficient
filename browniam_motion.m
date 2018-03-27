% browniam_motion
% calculate the browniam motion
% Imputs:
% dmb = dimension.
% npassos = number of steps + 1
% d = diffusion coefficient
% t = tempo total (default 1.0)

% Source:
% http://people.sc.fsu.edu/~jburkardt/m_src/brownian_motion_simulation/brownian_motion_simulation.m
% One dimension implementation.
% John Burkardt.
% Department of Scientific Computing at Florida State University (FSU).

function x = browniam_motion(dmb,npassos,d,t)
dt = t / ( npassos - 1 );
rng('shuffle','twister');
x = zeros ( dmb, npassos );
s =sqrt (2.0* d * dt ) * randn ( 1, npassos - 1 );
   dx(1:dmb,1:npassos-1) = s(1:npassos-1);
x(1:dmb,2:npassos) = cumsum ( dx(1:dmb,1:npassos-1), 2 );

return
end

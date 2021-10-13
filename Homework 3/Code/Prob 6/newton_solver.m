function [xr, n, flag]=newton_solver(g, x0, tol)
%Code from Professor Hongyun Wang at UCSC
n=0;    % number of iterations completed so far
err=1;
h=1.0e-5; % step size for numerical differentiation
%
while (err>tol) && isfinite(err)
  n=n+1;
  gp=(g(x0+h)-g(x0-h))/(2*h);   % numerical differentiation
  dx=-g(x0)/gp;       % Newton's method
  err=abs(dx);
  x0=x0+dx;
end

xr=x0; flag=(err<=tol);

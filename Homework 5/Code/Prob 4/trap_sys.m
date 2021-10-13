function [um,tv] = trap_sys(A,b,t0,w0,dt,N)

m = size(A,1);


tv = zeros(1,N+1);tv(1) = t0;
um = zeros(m,N+1); um(:,1) = w0;
tn = t0; wn = w0;

for n = 1:N
    k1 = (dt*(A*wn+b));
    k2 = (eye(m)- .5*dt*A)\(dt*(A*(wn+.5*k1)+b));
    tn = tn + dt;
    wn = wn + .5*k1 + .5*k2;
    tv(n+1) = tn;
    um(:,n+1) = wn;
end
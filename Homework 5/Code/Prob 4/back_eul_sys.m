function [um,tv] = back_eul_sys(A,b,t0,w0,dt,N)

m = size(A,1);
At = eye(m)- dt*A;

tv = zeros(1,N+1);tv(1) = t0;
um = zeros(m,N+1); um(:,1) = w0;
tn = t0; wn = w0;

for n = 1:N
    k1 = At\(dt*(A*wn+b));
    tn = tn + dt;
    wn = wn+k1;
    tv(n+1) = tn;
    um(:,n+1) = wn;
end
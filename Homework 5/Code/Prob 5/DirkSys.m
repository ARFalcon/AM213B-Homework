function [um,tv] = DirkSys(A,b,t0,w0,dt,N)

m = size(A,1);
alpha=1-1/sqrt(2);
At = eye(m)- alpha*dt*A;
tv = zeros(1,N+1);tv(1) = t0;
um = zeros(m,N+1); um(:,1) = w0;
tn = t0; wn = w0;

for n = 1:N
    k1=At\(dt*A*wn+dt*b(tn+alpha*dt));
    k2=At\(dt*A*(wn+(1-alpha)*k1)+dt*b(tn+dt));
    wn=wn+(1-alpha)*k1+alpha*k2;
    tn = tn + dt;
    tv(n+1) = tn;
    um(:,n+1) = wn;
end
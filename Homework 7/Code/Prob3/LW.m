function u = LW(u0,N,dt,uxt,g,NT,a,r,L2)

u = u0;
for k = 1:NT
    t = k*dt;
    u(2:N)=u(2:N)-0.5*r*a*(u(3:N+1)-u(1:N-1))+...
        0.5*(r*a)^2*(u(3:N+1)-2*u(2:N)+u(1:N-1));
    u(1) = g(t);
    u(N+1) = uxt(L2,t);
end
end
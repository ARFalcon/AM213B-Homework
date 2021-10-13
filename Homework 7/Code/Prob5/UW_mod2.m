function u = UW_mod2(u0,N,dt,g,NT,a,r)
u=u0;u(1) = g(0);
for k = 1:NT
    t = k*dt;
    u(2:N+1)=u(2:N+1)-r*a*(u(2:N+1)-u(1:N));
    u(1) = g(t);
    u(N+1) = 0;

end
end
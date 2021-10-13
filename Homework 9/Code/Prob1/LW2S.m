function u = LW2S(F,w0,T,r,dx)
u=w0;
dt = r*dx;
NT = round(T/dt);
m = size(u,2);
N = m-2;
for i = 1:NT
    
    LW = 0.5*(u(:,2:m)+u(:,1:m-1))-(r/2*(F(u(:,2:m))-F(u(:,1:m-1))));
    u(:,2:N+1) = u(:,2:N+1)- r*(F(LW(:,2:N+1))-F(LW(:,1:N)));
    u(:,1) = u(:,2); u(:,N+2) = u(:,N+1);
    
end



end
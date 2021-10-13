function u = LW(ALF,F,~,u,T,r,dx)
dt = r*dx;
NT = round(T/dt);
m = size(u,2);
N = m-2;
for i = 1:NT
    
    a = ALF(u(1:m-1),u(2:m));
    du = u(2:m)-u(1:m-1);
    LW = 0.5*(F(u(1:m-1))+F(u(2:m)))-r/2*(a.^2).*du;
    u(2:N+1) = u(2:N+1)- r*(LW(2:N+1)-LW(1:N));
    u(1) = u(2); u(N+2) = u(N+1);
    
end
end
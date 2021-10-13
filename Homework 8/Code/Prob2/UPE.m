function u = UPE(ALF,F,Fp,u,T,r,dx)
dt = r*dx;
NT = round(T/dt);
m = size(u,2);
N = m-2;
for i = 1:NT
    a = ALF(u(1:m-1),u(2:m));
    psi = max([abs(a); -Fp(u(1:m-1)); Fp(u(2:m))],[],1);
    du = u(2:m)-u(1:m-1);
    FUP = 0.5*(F(u(1:m-1))+F(u(2:m)))-0.5*psi.*du;
    u(2:N) = u(2:N)- r*(FUP(2:N)-FUP(1:N-1));
    u(1) = u(2); u(N+1) = u(N);
    
end
end
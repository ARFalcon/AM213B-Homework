clc; clear; close all;

L1 = 0; L2 = 4*pi;
N = 400;
dx = (L2-L1)/N;
x = L1+((0:N+1)-.5)*dx;
r = 1/pi;
dt = r*dx;
T = 0.8;
NT = round(T/dt);
afun = @(x,t) sin(x) + cos(x);
bfun = @(x,t) -sin(x);
cfun = @(x,t) 0*x;
f = @(x) cos(x).^2;

u0 = f(x);
u = u0;
a = afun(x);
b = bfun(x);
u_MOC = u;
for i = 1:NT
    u = LW_1dt(u,a,b,r,dt);
end

bx = @(x,t) -cos(x);


for i = 1:numel(x)
    u_MOC(i) = MoC(afun,bx,cfun,f,T,x(i),dt);
end

figure(1)
hold on; grid on; box on;
plot(x,u)
plot(x,u_MOC)
legend('LW','MoC')
xlabel('x')
ylabel('u(x,t)')
title('Plot of LW vs MoC at t=0.8')
saveas(gcf,('Prob2fig1.png'))
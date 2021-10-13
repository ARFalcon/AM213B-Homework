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
u400 = u0;
a = afun(x);
b = bfun(x);
u_MOC = u400;
for i = 1:NT
    u400 = LW_1dt(u400,a,b,r,dt);
end

bx = @(x,t) -cos(x);
for i = 1:numel(x)
    u_MOC(i) = MoC(afun,bx,cfun,f,T,x(i),dt);
end

N = 800;
dx = (L2-L1)/N;
x800 = L1+((0:N+1)-.5)*dx;
r = 1/pi;
dt = r*dx;
T = 0.8;
NT = round(T/dt);
u0 = f(x800);
u800 = u0;
a = afun(x800);
b = bfun(x800);
for i = 1:NT
    u800 = LW_1dt(u800,a,b,r,dt);
end

err_exact = u_MOC-u400;
err_esti = (spline(x800,u800,x)-u400)/(1-(.5^2));

figure(1)
hold on; grid on; box on;
plot(x,err_exact)
plot(x,err_esti)
legend('Exact Error','Estimated Error')
xlabel('x')
ylabel('error')
title('Plot of Exact error vs estimated error at t=0.8')
saveas(gcf,('Prob3fig1.png'))

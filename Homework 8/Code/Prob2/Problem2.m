clc; clear; close all;
F = @(u) .5*u.^2;
Fp = @(u) u;
ALF = @(u1,u2) .5*(u1+u2);
f = @(x) -.5*(x<=0)+(0<x & x<=1) + 0*(x>1);

L1 = -1; L2 = 2;
N = 300;
dx = (L2-L1)/N;
x = L1 + ( (0:N+1) - 0.5 )*dx;
r = 10/8;
u0 = f(x);
u = u0;
uext = @(x,t) -0.5.*(x<= -0.5*t) + x/t.*(-0.5*t<x & x<= t) + (t<x & x<1+.5*t) + 0*(x>1+.5*t);

UPE1 = UPE(ALF,F,Fp,u0,.5,r,dx);
figure(1)
hold on; grid on; box on;
plot(x,UPE1)
title('Upwind method 2 r=10/8 at t=0.5')
xlabel('x')
ylabel('u(x,.5)')
saveas(gcf,('Prob2fig1.png'))

figure(2)
hold on; grid on; box on;
UPE2 = UPE(ALF,F,Fp,u0,1.6,10/8.5,dx);
plot(x,UPE2)
plot(x,uext(x,1.6))
title('Upwind method 2 r=10/8.5 at t=1.6 vs exact')
legend('upwind method','exact','location','NW')
xlabel('x')
ylabel('u(x,1.6)')
saveas(gcf,('Prob2fig2.png'))
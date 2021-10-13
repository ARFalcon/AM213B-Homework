clc; clear; close all;

F = @(u) .5*u.^2;
Fp = @(u) u;
ALF = @(u1,u2) .5*(u1+u2);
f = @(x) -.5*(x<=0)+(0<x & x<=1) + 0*(x>1);

L1 = -1; L2 = 2;
N = 300;
dx = (L2-L1)/N;
x = L1 + ( (0:N+1) - 0.5 )*dx;
r = 0.5;
u0 = f(x);
T = 1;
u = u0;
uext = @(x,t) -0.5.*(x<= -0.5*t) + x/t.*(-0.5*t<x & x<= t) + (t<x & x<1+.5*t) + 0*(x>1+.5*t);

UPNE1 = UPNE(ALF,F,Fp,u0,T,r,dx);
UPE1 = UPE(ALF,F,Fp,u0,T,r,dx);
LW1 = LW(ALF,F,Fp,u0,T,r,dx);
figure(1)
hold on; grid on; box on;
plot(x,UPNE1)
plot(x,UPE1)
plot(x,LW1)
plot(x,uext(x,1))
legend('UpWind No Entropy Fix','UpWind Entropy Fix','Lax-Wendroff','exact','location','NW')
title('Numerical Soluitions compared with exact')
xlabel('x')
ylabel('u(x,1)')
saveas(gcf,('Prob1fig1.png'))

UPE2 = UPE(ALF,F,Fp,u0,0,r,dx);
UPE3 = UPE(ALF,F,Fp,u0,1,r,dx);
UPE4 = UPE(ALF,F,Fp,u0,1.5,r,dx);
UPE5 = UPE(ALF,F,Fp,u0,3,r,dx);
UPE6 = UPE(ALF,F,Fp,u0,6,r,dx);
figure(2)
hold on; box on; grid on;
plot(x,UPE2)
plot(x,UPE3)
plot(x,UPE4)
plot(x,UPE5)
plot(x,UPE6)
legend('t=0','t=1','t=1.5','t=3','t=6','location','NW')
title('Time evolution of Upwind method with Entropy fix')
ylim([-1 1.5])
xlabel('x')
ylabel('u(x,t)')
saveas(gcf,('Prob1fig2.png'))
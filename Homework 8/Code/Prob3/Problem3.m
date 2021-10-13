clc; clear; close all;
F = @(u) .25*u.^4;
Fp = @(u) u.^3;
ALF = @(u1,u2) 1/4*(u2.^3+u2.^2.*u1+u2.*u1.^2+u1.^3);
f = @(x) sin(pi*x);

L1 = 0; L2 = 4;
N = 400;
dx = (L2-L1)/N;
x = L1 + ( (0:N+1) - 0.5 )*dx;
r = .5;
u0 = f(x);
u = u0;

UPE1 = UPEMod(ALF,F,Fp,u0,0,r,dx);
UPE2 = UPEMod(ALF,F,Fp,u0,1,r,dx);
UPE3 = UPEMod(ALF,F,Fp,u0,3,r,dx);
UPE4 = UPEMod(ALF,F,Fp,u0,10,r,dx);
UPE5 = UPEMod(ALF,F,Fp,u0,40,r,dx);

figure(1)
hold on; grid on; box on;
plot(x,UPE1)
plot(x,UPE2)
plot(x,UPE3)
plot(x,UPE4)
plot(x,UPE5)
title('Plot for u(x,t) vs x for different times t')
legend('t=0','t=1','t=3','t=10','t=40')
xlabel('x')
ylabel('u(x,t)')
saveas(gcf,('Prob3fig1.png'))

figure(2)
hold on; grid on; box on;
UPEMAX1 = UPE1./max(UPE1);
UPEMAX2 = UPE2./max(UPE2);
UPEMAX3 = UPE3./max(UPE3);
UPEMAX4 = UPE4./max(UPE4);
UPEMAX5 = UPE5./max(UPE5);
plot(x,UPEMAX1)
plot(x,UPEMAX2)
plot(x,UPEMAX3)
plot(x,UPEMAX4)
plot(x,UPEMAX5)
title('Plot for u(x,t)/max(u(x,t)) vs x for different times t')
legend('t=0','t=1','t=3','t=10','t=40')
xlabel('x')
ylabel('u(x,t)')
saveas(gcf,('Prob3fig2.png'))
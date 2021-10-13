clc; clear; close all;

p = @(x) 0*x;
q = @(x) -(1+exp(-sin(x)));
r = @(x) -5-(sin(x).^2);
a = 0;
alpha = 1.5;
b = 2;
beta = .5;
N = 1000;

[XVec,UVec] = FDM_problem6(p,q,r,a,b,alpha,beta,N);
figure(1)
box on;
plot(XVec,UVec,'-g','linewidth',1.5)
title('Plot of u(x) vs x','fontsize',14)
xlabel('x','fontsize',14)
ylabel('u(x)','fontsize',14)
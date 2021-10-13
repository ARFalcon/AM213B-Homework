clc; clear; close all;

L = 2;
alpha = .4;
dt = 4*10^(-5);
N = 200;
TF = 3;
dx = L/(N-.5);
X = ((0:N)-.5)*dx;

T = 0:dt:TF;
NT = numel(T);
NX = numel(X);
usave = zeros(4,NX);
u = (1-.5*X).^2;
r = dt/(dx^2);

t_save = [501,12501,25001,75001];
for i = 1:4
    u = (1-.5*X).^2;
    for n = 1:t_save(i)-1    
        u(2:NX-1) = u(2:NX-1) + r*(u(3:NX)-2*u(2:NX-1)+u(1:NX-2));
        u(NX) = 2.*sin(T(n)).^2;
        u(1) = ((2-alpha*dx)/(2+alpha*dx))*u(2);
    end
    usave(i,:) = u;
end

figure(1)
hold on; box on; grid on;
plot(X,usave(1,:))
plot(X,usave(2,:))
plot(X,usave(3,:))
plot(X,usave(4,:))
legend('t=.02','t=.5','t=1','t=3','fontsize',14,'location','NW')
title('Plot of u(x,t) vs. x for different t levels','fontsize',14)
xlabel('x','fontsize',14)
ylabel('u(x,t)','fontsize',14)
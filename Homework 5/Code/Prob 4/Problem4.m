clc; close all; clear;

TF = .2;
dx = .01;
dt = .01;
L = 2;
X = 0:dx:L;
t0 = 0;
T = t0:dt:TF;
NT = numel(T)-1;
N = L/dx;
gl = 1;
gr = 0;
u0 = (X(2:N)<1);
A = diag(ones(N-2,1),-1) + diag(ones(N-2,1),1)+diag(-2*ones(N-1,1));
A = A./dx^2;
b = zeros(N-1,1);
b(1) = gl/dx^2;
b(N-1) = gr/dt^2;


[um,tv] = back_eul_sys(A,b,t0,u0',dt,NT);
um(2:N,:) = um;
um(1,:) = ones(NT+1,1)*gl;
um(N+1,:) = ones(NT+1,1)*gr;


[umt,tvt] = trap_sys(A,b,t0,u0',dt,NT);
umt(2:N,:) = umt;
umt(1,:) = ones(NT+1,1)*gl;
umt(N+1,:) = ones(NT+1,1)*gr;
figure(1)
hold on;box on;grid on;

plot(X,um(:,2))
plot(X,um(:,5))
plot(X,um(:,10))
plot(X,um(:,21))
legend('t=.01','t=.04','t=.09','t=.2')
title('Plot of u(x,t) vs x at different time values (BTCS method)')
xlabel('x')
ylabel('u(x,t)')

figure(2)
hold on; box on; grid on;

plot(X,umt(:,2))
plot(X,umt(:,5))
plot(X,umt(:,10))
plot(X,umt(:,21))
legend('t=.01','t=.04','t=.09','t=.2')
title('Plot of u(x,t) vs x at different time values (CN method)')
xlabel('x')
ylabel('u(x,t)')
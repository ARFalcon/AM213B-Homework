clc; clear; close all;

a = 1.5;
L1 = -0.5; L2 = 2.5;
f = @(xv) cos(pi*xv);
g = @(tv) sin(a*pi*tv);
uxt = @(xv,tv) f(xv-a*tv).*((xv-a*tv)>-0.5) + g(tv-(xv+0.5)/a).*((xv-a*tv)<=-0.5);
N = 300;
r = .3;
T = 1.08;
dx = 3/N; X = L1+(0:N)*dx;
dt = r*dx;
NT = round(T./dt);

u0 = f(X);
u=u0; u(1) = g(0);



u_UW1 = UW_mod(u0,N,dt,g,NT,a,r);
u_LF1 = LF_mod(u0,N,dt,g,NT,a,r);
u_LW1 = LW_mod(u0,N,dt,g,NT,a,r);


exact = uxt(X,1.08);

error_UW1 = abs(u_UW1-exact);
error_LF1 = abs(u_LF1-exact);
error_LW1 = abs(u_LW1-exact);

figure(1)
hold on;
plot(X,exact)
plot(X,u_UW1)
plot(X,u_LF1)
plot(X,u_LW1)
title('Numerical soluitions for 3 methods with exact for comparison')
legend('Exact','Upwind','Lax-Friedrichs','Lax-Wendroff','location','SE')
xlabel('x')
ylabel('u(x,t)')

figure(2)
hold on;
set(gca,'Yscale','log')
plot(X,error_UW1)
plot(X,error_LF1)
plot(X,error_LW1)
title('Plot of errors for 3 method')
legend('Upwind Error','Lax-Friedrichs Error','Lax-Wendroff Error','location','SE')
xlabel('x')
ylabel('error')
clc; clear; close all;

a = 1.5;
L1 = -0.5; L2 = 2.5;
f = @(xv) -cos(pi*xv);
g = @(tv) sin(a*pi*tv);
uxt = @(xv,tv) f(xv-a*tv).*((xv-a*tv)>-0.5) + g(tv-(xv+0.5)/a).*((xv-a*tv)<=-0.5);
N = 300;
r = [.3,.6];
T = 1.08;
dx = 3/N; X = L1+(0:N)*dx;
dt = r*dx;
NT = round(T./dt);

u0 = f(X);
u=u0; u(1) = g(0);



u_UW1 = UW(u0,N,dt(1),g,NT(1),a,r(1));
u_LF1 = LF(u0,N,dt(1),uxt,g,NT(1),a,r(1),L2);
u_LW1 = LW(u0,N,dt(1),uxt,g,NT(1),a,r(1),L2);

u_UW2 = UW(u0,N,dt(2),g,NT(2),a,r(2));
u_LF2 = LF(u0,N,dt(2),uxt,g,NT(2),a,r(2),L2);
u_LW2 = LW(u0,N,dt(2),uxt,g,NT(2),a,r(2),L2);
exact = uxt(X,1.08);

error_UW1 = abs(u_UW1-exact);
error_LF1 = abs(u_LF1-exact);
error_LW1 = abs(u_LW1-exact);

error_UW2 = abs(u_UW2-exact);
error_LF2 = abs(u_LF2-exact);
error_LW2 = abs(u_LW2-exact);

figure(1)
hold on;
set(gca,'Yscale','log')
plot(X,error_UW1)
plot(X,error_LF1)
plot(X,error_LW1)
title('Plot of errors for 3 method when r=.3')
xlabel('x')
ylabel('error')
legend('Upwind Error','Lax-Friedrichs Error','Lax-Wendroff Error','location','SE')

figure(2)
hold on;
set(gca,'Yscale','log')
plot(X,error_UW2)
plot(X,error_LF2)
plot(X,error_LW2)
title('Plot of errors for 3 method when r=.6')
xlabel('x')
ylabel('error')
legend('Upwind Error','Lax-Friedrichs Error','Lax-Wendroff Error','location','SE')

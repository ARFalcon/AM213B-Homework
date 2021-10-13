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


u_UW1 = UW_mod2(u0,N,dt,g,NT,a,r);
u_LF1 = LF_mod2(u0,N,dt,g,NT,a,r);
u_LW1 = LW_mod2(u0,N,dt,g,NT,a,r);


exact = uxt(X,1.08);

error_UW1 = abs(u_UW1-exact);
error_LF1 = abs(u_LF1-exact);
error_LW1 = abs(u_LW1-exact);

figure(1)
hold on; box on;
set(gca,'Yscale','log')
plot(X,error_UW1)
plot(X,error_LF1)
plot(X,error_LW1)
title('Plot of errors for 3 method')
legend('Upwind Error','Lax-Friedrichs Error','Lax-Wendroff Error','location','SE')
xlabel('x')
ylabel('error')

N = 600;
r = .3;
T = 1.08;
dx = 3/N; X2 = L1+(0:N)*dx;
dt = r*dx;
NT = round(T./dt);
u0 = f(X2);

u_LW2 = LW_mod2(u0,N,dt,g,NT,a,r);
Err_Esti = zeros(1,301);
for i =1:301
    Err_Esti(i) = abs((u_LW1(i)-u_LW2(2*i-1))/(1-(1/2)^2));
end

exact = uxt(X2,1.08);
error_LW2 = abs(u_LW2-exact);

figure(2)
hold on;
set(gca,'Yscale','log')
plot(X,Err_Esti)
plot(X,error_LW1)
title('Numerical error vs Exact error')
legend('Numerical error','Exact error','location','SE')
xlabel('x')
ylabel('error')






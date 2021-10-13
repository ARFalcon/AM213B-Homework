clc; clear; close all;

L = 2;
alpha = .4;
dt = 10^(-5);

N = 100;
TF = 3;
dx = L/(N-.5);
X = ((0:N)-.5)*dx;

T = 0:dt:TF;
NT = numel(T);
NX = numel(X);
r = dt/(dx^2);
x = ((0:.002:1))*L;

u100 = (1-.5*X).^2;
for n = 1:NT-1    
    u100(2:NX-1) = u100(2:NX-1) + r*(u100(3:NX)-2*u100(2:NX-1)+u100(1:NX-2));
    u100(NX) = 2.*sin(T(n)).^2;
    u100(1) = ((2-alpha*dx)/(2+alpha*dx))*u100(2);
end

u100_spline = spline(X,u100,x);

N = 200;
TF = 3;
dx = L/(N-.5);
X = ((0:N)-.5)*dx;

T = 0:dt:TF;
NT = numel(T);
NX = numel(X);
r = dt/(dx^2);

u200 = (1-.5*X).^2;
for n = 1:NT-1    
    u200(2:NX-1) = u200(2:NX-1) + r*(u200(3:NX)-2*u200(2:NX-1)+u200(1:NX-2));
    u200(NX) = 2.*sin(T(n)).^2;
    u200(1) = ((2-alpha*dx)/(2+alpha*dx))*u200(2);
end

u200_spline = spline(X,u200,x);

N = 400;
TF = 3;
dx = L/(N-.5);
X = ((0:N)-.5)*dx;

T = 0:dt:TF;
NT = numel(T);
NX = numel(X);
r = dt/(dx^2);

u400 = (1-.5*X).^2;
for n = 1:NT-1    
    u400(2:NX-1) = u400(2:NX-1) + r*(u400(3:NX)-2*u400(2:NX-1)+u400(1:NX-2));
    u400(NX) = 2.*sin(T(n)).^2;
    u400(1) = ((2-alpha*dx)/(2+alpha*dx))*u400(2);
end


u400_spline = spline(X,u400,x);

figure(1)
hold on; grid on; box on;
plot(x,(u100_spline-u200_spline))
plot(x,(u200_spline-u400_spline))
title('Plot of errors for u100 and u200')
xlabel('x')
ylabel('estimated error')
legend('u100-u200','u200-u400','location','NW')






clc; clear; close all;

LX1 = 0; LY1 = 0;
LX2 = 2*pi; LY2 = 2*pi;
N = 200;
dx = (LX2 - LX1)/N;
dy = (LY2 - LY1)/N;
r = 1/pi;
x = LX1+((0:N+1)-.5)*dx;
y = LY1+((0:N+1)-.5)*dy;
dt = r*dx;
T = 1;
NT = round(T/dt);

afun = @(x,y) sin(x).*sin(y);
bfun = @(x,y) 0*x*y;
f = @(x,y) sin(x+y).^2;
[X,Y] = meshgrid(x,y);
u = f(X,Y);
Amat = afun(X,Y);

for i = 1:NT
    for j = 1:N+2
        u1 = u(j,:);a = Amat(j,:);b=0*a;
        u2 = LW_1dt(u1,a,b,r,dt);
        u(j,:) = u2;
    end
end

figure(1)
contourf(x,y,u)
colorbar
xlabel('x')
ylabel('y')
zlabel('u(x,y,t)')
title('Contour plot of u vs (x,y) at t=1')
saveas(gcf,('Prob4fig1.png'))

figure(2)
surf(x,y,u,'edgecolor','none')
xlabel('x')
ylabel('y')
zlabel('u(x,y,t)')
title('Surface plot of u vs (x,y) at t=1')
saveas(gcf,('Prob4fig2.png'))
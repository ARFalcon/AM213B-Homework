clc;close all;clear;

f = @(w,x)[w(2), sin(x)+(1+.5*w(2)^2)*w(1)];
x0 = 0;
h = .002;
X = 2;
x = (x0:h:X+x0);
N = numel(x)-1;
b = .5;
tol = 1e-12;

g =@(v) RK4_mod(f,x0,[1,v],h,N)-b;
v = newton_solver(g,-1,tol);
[sol_vec,x_vec] = RK4(f,x0,[1,v],h,N);


figure(1)
grid on; box on;
plot(x_vec,sol_vec(:,1))
title('u(x) vs. x','FontSize',16)
xlabel('x','FontSize',16)
ylabel('u(x)','FontSize',16)
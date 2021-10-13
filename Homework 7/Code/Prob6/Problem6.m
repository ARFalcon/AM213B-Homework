clc; clear; close all;

ax = @(x,t) sin(x) + cos(x);
bx = @(x,t) -sin(x);
cx = @(x,t) 0*x;
u0x = @(x) cos(x)^2;

t = [.2,.5,1];
h = 0.005;
N = round(t/h);
x = linspace(0,4*pi,400);
X = zeros(2,400);
for i = 1:3
    for j = 1:400
       X(i,j) = MoC(ax,bx,cx,u0x,t(i),x(j),h);
    end
end


figure(1)
hold on; box on; grid on;
plot(x,X(1,:))
plot(x,X(2,:))
plot(x,X(3,:))
title('Method of characteristics at different times')
legend('t=0.2','t=0.5','t=1')
xlabel('x')
ylabel('u(x,t)')
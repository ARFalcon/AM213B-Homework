clc; clear; close all;

L1 = -2; L2 = 2;
N = 400;
r = .5;
dx = (L2-L1)/N;
T = 1.5;
x = L1+((0:N+1)-.5)*dx;

F = @(w) [w(1,:).*w(2,:)/2;(w(1,:).^2+w(2,:).^2)/4];

f = @(x) [2.5;.25].*(x<=0) + [.75;.25].*(x>0);

w0 = f(x);

LW1 = LW2S(F,w0,T,r,dx);

figure(1)
hold on; grid on; box on;
plot(x,LW1(1,:))
plot(x,LW1(2,:))
xlabel('x')
ylabel('u(x,t)')
legend('w_1','w_2')
title('Plot of w_1 and w_2')
saveas(gcf,('Prob1fig1.png'))
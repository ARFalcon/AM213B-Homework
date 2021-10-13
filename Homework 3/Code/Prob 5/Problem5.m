clc; clear; close all;

h = 2^(-5);
T = 30;
Nsteps = T/h;
a = 1- (1/sqrt(2));

f = @(u,t) -1*(.5 + exp(20*cos(1.3*t)))*sinh(u-cos(t));
t0 = 0;
u0 = 0;

[wv,tv] = DIRK_solver(f,t0,u0,h,Nsteps,a);

figure(1)
hold on; box on;
ylim([-1 1.75])
xlim([0 30])
plot(tv,wv,'-r')
plot(tv,cos(tv),'-b')
legend('u(t)','cos(t)','FontSize',14)
title('Plot of u(t) vs t compared with cos(t) vs t','FontSize',14)
xlabel('t')

hold off;

figure(2)
hold on; box on;
set(gca,'YScale','log','XScale','log')
loglog(.5 + exp(20*cos(1.3*tv(2:961))),abs(wv(2:961)-cos(tv(2:961))),'ro')
title('Plot of |u(t)-cos(t)| vs .5 + exp(20*cos(1.3*tv))','FontSize',14)
xlabel('(0.5+exp(20cos(1.3t)))')
ylabel('u(t)-cos(t)')

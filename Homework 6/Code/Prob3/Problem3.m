clc; clear; close all;

x = 1.45;
h = 10.^(-(1:.2:14));
q1 = @(h) (sin(x+h)-sin(x))./h;
q2 = @(h) (sin(x+h)-sin(x-h))./(2.*h);
E1 = abs(q1(h) - cos(x));
E2 = abs(q2(h) - cos(x));

figure(1)
hold on; box on;
set(gca,'YScale','log','XScale','log')
loglog(h,E1)
loglog(h,E2)
title('Compairson of 1st and 2nd order numerical differentiations')
legend('1st order','2nd order')
xlabel('h size')
ylabel('error')
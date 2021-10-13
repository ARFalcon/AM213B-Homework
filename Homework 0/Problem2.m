clc; clear all; close all;

h = 2.^(-[0:.5:10]);
x = 1;
er_1 = abs(((sin(x+h)-sin(x))./h)-cos(x));
er_2 = abs(((sin(x+h)-sin(x-h))./(2*h))-cos(x));

figure(1); hold on; box on;
title('Error of numerical differentiation')
xlabel('h')
ylabel('e(h)')
set(gca,'YScale','log','XScale','log')
loglog(h,er_1,'-o','MarkerEdgeColor','b','MarkerFaceColor','r','LineWidth',1,'Color','b','MarkerSize',8)
loglog(h,er_2,'-s','MarkerEdgeColor','r','MarkerFaceColor','y','LineWidth',1,'Color','r','MarkerSize',8)
legend('First order method','Second order method','Location','southeast','FontSize',14)
ylim([5*10^-8 1])
xlim([5*10^-4 1])
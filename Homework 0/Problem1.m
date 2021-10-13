clc; clear all; close all;

x = 0:.25:6.75;
u = sin(x)+ (x./2);
v = cos(x);
w = x.*(2-x/3)+1;


figure(1); hold on; box on;
plot(x,u,'k','LineWidth',1.5)
plot(x,v,'-o','MarkerEdgeColor','b','MarkerFaceColor','r','LineWidth',1,'Color','b','MarkerSize',8)
plot(x,w,'-s','MarkerEdgeColor','r','MarkerFaceColor','y','LineWidth',1,'Color','r','MarkerSize',8)
legend('sin(x)+x/2','cos(x)','x*(2-x/3)+1','Location','northwest','FontSize',14)
title('Comparison of several functions')
ylabel('f(x)')
xlabel('x')
ylim([-1.5 6.25])
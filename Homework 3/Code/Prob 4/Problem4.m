clc; close all; clear;


a = [1 - 1/sqrt(2),.5];
LowX = -3; UpX = 12;
LowY = -8; UpY = 9;
n = 200;

x1d = LowX + (UpX-LowX)*(0:n)/n;
y1d = LowY + (UpY-LowY)*(0:n)/n;

[x2d,y2d] = meshgrid(x1d,y1d);

%convert to complex numbers
z = x2d + sqrt(-1)*y2d;

f1 = abs(1 + z + (z.^2)./2);
f2 = abs(1 + z + (z.^2)./2 + (z.^3)./6 + (z.^4)./24);
f3 = abs((1 + (1-2.*a(1)).*z)./(1-a(1).*z).^2);
f4 = abs((1 + (1-2.*a(2)).*z)./(1-a(2).*z).^2);


figure(1)
hold on; box on; grid on;
set(gca,'fontsize',14)
[~,c1] = contour(x2d,y2d,f1,[1,1],'-k','linewidth',1.5);
[~,c2] = contour(x2d,y2d,f2,[1,1],'-g','linewidth',1.5);
[~,c3] = contour(x2d,y2d,f3,[1,1],'-b','linewidth',1.5);
[~,c4] = contour(x2d,y2d,f4,[1,1],'-r','linewidth',1.5);
legend([c1,c2,c3,c4],'Heun''s method','Classic RK4','2s - DIRK, a = 1-1/sqrt(2)','2s - DIRK, a = 0.5')
title('Region of absolute stability for four methods')
xlabel('X')
ylabel('Y')
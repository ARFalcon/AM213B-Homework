clc; clear; close all;

LowX = -5; UpX = 5;
LowY = -5; UpY = 5;
n = 256;


%Defin rho and sigma polys
rho1 =  @(x1) x1.^3 - x1.^2;
rho2 =  @(x2) x2.^2 -1;
rho3 =  @(x3) (3/2).*x3.^2-2.*x3 +(1/2);
rho4 =  @(x4) (11/6).*x4.^3 -3.*x4.^2 + (3/2).*x4-(1/3);

sigma1 = @(x1) (9/24).*x1.^3 + (19/24).*x1.^2-(5/24).*x1+(1/24);
sigma2 = @(x2) (1/3).*x2.^2 + (4/3).*x2 + (1/3);
sigma3 = @(x3) x3.^2;
sigma4 = @(x4) x4.^3;

theta = (0:n)/n*2*pi;
x1 = exp(sqrt(-1)*theta);
x2 = exp(sqrt(-1)*theta);
x3 = exp(sqrt(-1)*theta);
x4 = exp(sqrt(-1)*theta);

z1a = rho1(x1)./sigma1(x1);
z2a = rho2(x2)./sigma2(x2);
z3a = rho3(x3)./sigma3(x3);
z4a = rho4(x4)./sigma4(x4);

xv1a = real(z1a);
xv2a = real(z2a);
xv3a = real(z3a);
xv4a = real(z4a);

yv1a = imag(z1a);
yv2a = imag(z2a);
yv3a = imag(z3a);
yv4a = imag(z4a);

z1b = rho1(1.05*x1)./sigma1(1.05*x1);
z2b = rho2(1.05*x2)./sigma2(1.05*x2);
z3b = rho3(1.05*x3)./sigma3(1.05*x3);
z4b = rho4(1.05*x4)./sigma4(1.05*x4);

xv1b = real(z1b);
xv2b = real(z2b);
xv3b = real(z3b);
xv4b = real(z4b);

yv1b = imag(z1b);
yv2b = imag(z2b);
yv3b = imag(z3b);
yv4b = imag(z4b);


figure(1)
h3=fill(xv1a,yv1a,0.75*[1 1 1]);
hold on; grid on; box on;
h1a = plot(xv1a,yv1a,'b-','linewidth',1.5);
h1b = plot(xv1b,yv1b,'r--','linewidth',1.5);
plot([0,0],[2,-2],'k');
plot(xv1a,0,'k','linewidth',2);
title('3-step Adams-Moulton')
xlabel('Re(z)')
ylabel('Im(z)')
axis('equal')
legend([h1a,h1b,h3],'b=1','b=1.05','S');

figure(2)
hold on; grid on; box on;
h2a = plot(xv2a,yv2a,'b-','linewidth',1.5);
h2b = plot(xv2b,yv2b,'r--','linewidth',1.5);
plot([0,0],[2,-2],'k');
title('2-step 4th-order LMM')
xlabel('Re(z)')
ylabel('Im(z)')
axis('equal')
legend([h2a,h2b],'b=1','b=1.05');

figure(3)
d=0;
xf=[LowX-d,LowX-d,UpX+d,UpX+d,LowX-d];
yf=[LowY-d,UpY+d,UpY+d,LowY-d,LowY-d];
h3=fill(xf,yf,0.75*[1 1 1]);
hold on; grid on; box on;
h3a = plot(xv3a,yv3a,'b-','linewidth',1.5);
fill(xv3a,yv3a,[1 1 1])
h3b = plot(xv3b,yv3b,'r--','linewidth',1.5);
plot([0,0],[5,-5],'k');
title('BDF2')
xlabel('Re(z)')
ylabel('Im(z)')
legend([h3a,h3b,h3],'b=1','b=1.05','S');

figure(4)
d=3;
xf=[LowX-d,LowX-d,UpX+d,UpX+d,LowX-d];
yf=[LowY-d,UpY+d,UpY+d,LowY-d,LowY-d];
h3=fill(xf,yf,0.75*[1 1 1]);
hold on; grid on; box on;
h4a = plot(xv4a,yv4a,'b-','linewidth',1.5);
fill(xv4a,yv4a,[1 1 1])
h4b = plot(xv4b,yv4b,'r--','linewidth',1.5);
plot([0,0],[8,-8],'k');
title('BDF3')
xlabel('Re(z)')
ylabel('Im(z)')
legend([h4a,h4b,h3],'b=1','b=1.05','S');

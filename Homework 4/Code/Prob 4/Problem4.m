clc; clear; close all;

p = @(x) 0*x;
q = @(x) -625 + 0*x;
r = @(x) -625*x;
a = 0;
alpha = 1;
b = 2;
beta = 1;
N = 1000;

[XVec,UVec] = FDM(p,q,r,a,b,alpha,beta,N);

figure(1)
hold on; box on;
plot(XVec,UVec,'-ob','linewidth',1)
plot(XVec,(XVec+((1+exp(-50)/(1-exp(-100)))*exp(-25*XVec)-exp(25*(XVec-2)))),'-r','linewidth',2)
hold off
title('Plot of Numerical vs Exact Soluition')
xlabel('x')
ylabel('u(x)')
legend('Numerical','Exact','location','NorthWest')

[XVec2,UVec2] = FDM(p,q,r,a,b,alpha,beta,N*2);
Err_Esti = zeros(N+1,1);
for i = 1:N+1
    Err_Esti(i) = (UVec(i)-UVec2(2*i-1))/(1-1/2^2);
end

Err_Exct = UVec - (XVec+((1+exp(-50)/(1-exp(-100)))*exp(-25*XVec)-exp(25*(XVec-2))));

figure(2)
hold on; box on;
plot(XVec,Err_Esti,'-ob')
plot(XVec,Err_Exct,'linewidth',2)
hold off
title('Plot of Estimated error vs Exact Error')
xlabel('x')
ylabel('error')
legend('Estimated','Exact')
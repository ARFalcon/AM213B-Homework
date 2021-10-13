clc; clear; close all;

iter = 1;
max_iter = 10000;
tol = 10^-12;
x0 = 0;
h = 10^-5;
a = .9;
b = 50000;
S = 0:.1:20;
n = numel(S);
X = zeros(1,n);


for i = 1:n
    s = S(i);
    err = 1;
    iter = 0;
    while err > tol && iter < max_iter 
        numDiff = (prob3Fun(x0+h,a,b,s)-prob3Fun(x0-h,a,b,s))/(2*h);
        dx = -prob3Fun(x0,a,b,s)/numDiff;
        err = abs(dx);
        x0 = x0 + dx;
        iter = iter +1;
    end
    X(i) = x0;
end

figure(1)
hold on
plot(S,X,'-dr')
plot(S,cos(S-1),'-b','LineWidth',1)
legend('x vs s', 'cos(s-1) vs s','FontSize',14)
ylim([-1 1.5])
title('Plot of x and cos(s-1)')
xlabel('s')
clc; clear; close all;

a = @(w,t)[sin(w(1))*sin(w(2)),1-exp(sin(w(1)+w(2)))];
b = @(w,t) -cos(w(1))*sin(w(2))+exp(sin(w(1)+w(2)))*cos(w(1)+w(2));
u0x = @(w) sin(w(1)+w(2))^2;
h = 0.01;
N = 80;
dx = 2*pi/N; dy = 2*pi/N; 
x = 0:dx:2*pi; y = 0:dy:2*pi;
t = [0,.5,1,1.25];
pt = [[3.9,2.3];[2.7,4.0];[2,3]];
for i = 1:4
    counter = i;
    u(j,k) = zeros(81,81);
    for j = 1:81
        for k = 1:81
            u(j,k) = MoC2d(a,b,u0x,t(i),[x(j) y(k)],h);
        end
    end
    figure(i)
    hold on; grid on; box on;
    contourf(x,y,u')
    colorbar
    title(sprintf('numerical soluitions for a grid when t=%.2f' ,t(i)))
    xlabel('x')
    ylabel('y')
    saveas(gcf,['Prob6fig' num2str(i) '.png'])
    

end




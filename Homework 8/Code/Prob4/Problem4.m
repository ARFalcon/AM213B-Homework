clc; clear; close all;

a = @(w,t)[sin(w(1))*sin(w(2)),1-exp(sin(w(1)+w(2)))];
b = @(w,t) -cos(w(1))*sin(w(2))+exp(sin(w(1)+w(2)))*cos(w(1)+w(2));
u0x = @(w) sin(w(1)+w(2))^2;
h = 0.01;
t = [.75,1.0,1.25];
y = linspace(0,2*pi,300);
u = zeros(3,300);
for i = 1:3
    for j = 1:300
        u(i,j) = MoC2d(a,b,u0x,t(i),[3.9,y(j)],h);
        
    end
end
figure(1)
hold on; grid on; box on;
plot(y,u(1,:))
plot(y,u(2,:))
plot(y,u(3,:))
title('numerical soluitions for different y values at 3 times')
xlabel('y')
ylabel('u(3.9,y,t)')
legend('t=0.75','t=1','t=1.25')
saveas(gcf,('Prob4fig1.png'))
for i = 1:3
    for j = 1:300
        u(i,j) = MoC2d(a,b,u0x,t(i),[2.5,y(j)],h);
        
    end
end
figure(2)
hold on; grid on; box on;
plot(y,u(1,:))
plot(y,u(2,:))
plot(y,u(3,:))
title('numerical soluitions for different y values at 3 times')
xlabel('y')
ylabel('u(2.5,y,t)')
legend('t=0.75','t=1','t=1.25')
saveas(gcf,('Prob4fig2.png'))
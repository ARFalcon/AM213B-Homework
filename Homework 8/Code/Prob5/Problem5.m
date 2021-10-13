clc; clear; close all;

a = @(w,t)[sin(w(1))*sin(w(2)),1-exp(sin(w(1)+w(2)))];
b = @(w,t) -cos(w(1))*sin(w(2))+exp(sin(w(1)+w(2)))*cos(w(1)+w(2));
u0x = @(w) sin(w(1)+w(2))^2;
h = 0.01;
t = 0:.01:1.25;
pt = [[3.9,2.3];[2.7,4.0];[2,3]];
u = zeros(3,126);
for i = 1:3
    for j = 1:126
        u(i,j) = MoC2d(a,b,u0x,t(j),pt(i,:),h);
        
    end
end
figure(1)
hold on; grid on; box on;
plot(t,u(1,:))
plot(t,u(2,:))
plot(t,u(3,:))
title('numerical soluitions for different y values at 3 times')
xlabel('t')
ylabel('u(x,y,t)')
legend('(x,y)=(3.9,2.3)','(x,y)=(2.7,4.0)','(x,y)=(2,3)','location','NW')
saveas(gcf,('Prob5fig1.png'))


clc; clear; close all;

f = @(w,t,u) [w(2),u*(2-exp(w(2)^2))*w(2)-w(1)];
u = [.5,2,4];
x0 = [3,.5];
h = .025;
T = 30;
N = T/h;
t0 = 0;
for i = 1:3
    mu = u(i); 
    [MatAns,TimeVec] = RK4(@(w,t) f(w,t,mu),t0,x0,h,N);
    figure(2*i-1)
    hold on; box on;
    plot(TimeVec,MatAns(:,1),'-r')
    plot(TimeVec,MatAns(:,2),'-b')
    title(sprintf('Plot of y and y'' vs t_n when mu=%.1f',mu),'FontSize',14)
    legend('y vs t','y'' vs t','Location','northwest','FontSize',14)
    xlabel('t_n','FontSize',14)
    hold off;
    
    figure(2*i)
    box on;
    plot(MatAns(:,1),MatAns(:,2))
    title(sprintf('Plot of y'' vs y when mu=%.1f',mu),'FontSize',14)
    xlabel('y','FontSize',14)
    ylabel('y''','FontSize',14)
    legend('y'' vs y','Location','southeast','FontSize',14)
    
end
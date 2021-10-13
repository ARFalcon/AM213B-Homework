clc; clear; close all;

f = @(w,t,u) [w(2),u*(2-exp(w(2)^2))*w(2)-w(1)];
u = 4;
x0 = [3,.5];
T = 30;
t0 = 0;
x = 10;
h = 0.025;
N = T/h;

[MatAns4_1,MatAns5_1,EFeh_1,TimeVec_1] = Feh45(@(w,t) f(w,t,u),t0,x0,h,N);
[MatAns4_2,MatAns5_2,EFeh_2,TimeVec_2] = Feh45(@(w,t) f(w,t,u),t0,x0,h/2,2*N);
Ev = zeros(N+1,1);
for i = 1:N+1
    Ev(i) = norm(MatAns5_1(i,:)-MatAns5_2(2*i-1,:))/(1-(.5)^5);
end

figure(1)
box on;
plot(TimeVec_1,EFeh_1)
set(gca,'YScale','log')
title('Plot of E^{(Fehlberg)}_n (h) vs t_n','FontSize',14)
xlabel('t_n','FontSize',14)
ylabel('E^{Fehlberg}_n(h)','FontSize',14)



figure(2)
box on; hold on;
plot(TimeVec_1,EFeh_1)
plot(TimeVec_1,Ev)
set(gca,'YScale','log')
title('Plot of E^{Fehlberg}_n and E_n vs t_n','FontSize',14)
xlabel('t_n','FontSize',14)
legend('E^{Fehlberg}_n','E_n','FontSize',14,'Location','southeast')
xlim([-1 28])
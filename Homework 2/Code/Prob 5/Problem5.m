clc; clear; close all;

f = @(w,t,u) [w(2),u*(2-exp(w(2)^2))*w(2)-w(1)];
u = 4;
x0 = [3,.5];
T = 30;
t0 = 0;
x = 10;
Emax = zeros(x,1);
H = zeros(x,1);
for i = 1:x
    h = 1/2^(i+2);
    H(i) = h;
    N = T/h;
    Ev = zeros(N+1,1);
    [MatAns1,TimeVec1] = RK4(@(w,t) f(w,t,u),t0,x0,h,N);
    [MatAns2,TimeVec2] = RK4(@(w,t) f(w,t,u),t0,x0,h/2,2*N);
    for j = 1:N+1
        err = norm((MatAns1(j,:)- MatAns2(2*j-1,:))/(1-(.5^4)));
        Ev(j) = err;
    end
    Emax(i) = max(Ev(~isinf(Ev)));
    if i == 6
        figure(2)
        hold on;
        plot(TimeVec1,Ev,'-r') 
    elseif i == 7
        set(gca,'YScale','log')
        plot(TimeVec1,Ev,'-b') 
        xlim([-1 30])
        title('Plot of ||En(h)|| vs t_n for hc and hc/2')
        legend('hc = 1/2^9','hc/2 = 1/2^{10}')
        xlabel('t_n')
        ylabel('||En(h)||')
        hold off;
       
    end
        
end

figure(1)
box on;
loglog(H,Emax)
title('Plot of Emax vs h')
xlabel('h')
ylabel('Emax')




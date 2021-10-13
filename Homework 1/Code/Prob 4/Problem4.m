clc; clear; close all;

t0 = 0;
u0 = 0;

%Basic Euler method
H=zeros(5,1);
for i = 1:5
    H(i) =  2^(-i-17);
end

T = 2^(-10);
for i = 1:size(H,2)
    
    h = H(i);
    t = t0:h:T+t0;
    u = zeros(size(t));
    u(1) =  u0;
    n = numel(u);
    
    for j = 1:n-1
       
        f = prob4Fun(u(j),t(j));
        u(j+1) = u(j) + h*f;
        
    end
    

    if i == 2 
        figure(1)
        box on
        plot(t(1:28),u(1:28),'-b')
        title('Time Step is not small enough','FontSize',14)
        ylabel('u(t)','FontSize',14)
        xlabel('t','FontSize',14)
    elseif i == 4
        figure(2)
        box on
        set(gca,'YScale','log','XScale','log')
        ylim([0,.6])
        loglog(t,u,'-r') 
        title('Time Step is small enough','FontSize',14)
        ylabel('u(t)','FontSize',14)
        xlabel('t','FontSize',14)
        ylim([.25,.6])
    end
    
end

%Backward Euler method
T = 10;
h = .1;
t = t0:h:T+t0;
u = zeros(size(t));
u(1) = u0;
n = numel(u);
tol = 10^-12;
l = 10^6;
f = @(x,u,t) x + h*prob4Fun(u,t);

for j = 1:n-1
    
    u(j+1) = new_sol(f,u(j+1),u(j),t(j+1),tol);
   
end
figure(3)
box on
plot(t,u,'k')
title('Plot of Backward Euler''s Method','FontSize',14)
xlabel('t','FontSize',14)
ylabel('u(t)','FontSize',14)

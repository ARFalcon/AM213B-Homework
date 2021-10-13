clc; clear; close all;
t0 = 0;
u0 = 0;
T = 10;
h = .1;
t = t0:h:T+t0;
u = zeros(size(t));
u(1) = u0;
n = numel(u);
tol = 10^-12;
%part 1
f = @(x,tx,u,t) x + (h/2)*(prob4Fun(x,tx) + prob4Fun(u,t));

for i = 1:n-1
    
    u(i+1) = new_sol_prob5(f,u(i+1),u(i),t(i),t(i+1),tol);
    
end

figure(1)
box on;
plot(t,u,'m')
title('Trapezoidal method with time step 0.1','FontSize',14)
xlabel('t','FontSize',14)
ylabel('u(t)','FontSize',14)
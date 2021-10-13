clc; clear; close all;

t0 = 0;
u0 = 1;


%Part 1
h = .2;
T = 2;
t = t0:h:T+t0;

%Euler's Method

ue = zeros(size(t));
ue(1) = u0;
n = numel(ue);


for i = 1:n-1
    
    f = prob6Fun(ue(i));
    ue(i+1) = ue(i) + h*f;
end

%2-step midpoint method

um = zeros(size(t));
um(1) = u0;
um(2) = exp(-h);
n = numel(um);

for i = 2:n-1
    
    f = prob6Fun(um(i));
    um(i+1) = um(i-1) + 2*h*f;
    
end

figure(1)
hold on; box on;
plot(t,ue,'-r')
plot(t,um,'-b')
plot(t,exp(-t),'-k')
title('Inteveral from [0:2] step size .2','FontSize',14)
legend('Euler Method','Midpoint Method','Exact')
ylabel('u(t)','FontSize',14)
xlabel('t','FontSize',14)
%Part 2 
h = .2;
T = 20;
t = t0:h:T+t0;

%Euler's Method

ue = zeros(size(t));
ue(1) = u0;
n = numel(ue);


for i = 1:n-1
    
    f = prob6Fun(ue(i));
    ue(i+1) = ue(i) + h*f;
end

%2-step midpoint method

um = zeros(size(t));
um(1) = u0;
um(2) = exp(-h);
n = numel(um);

for i = 2:n-1
    
    f = prob6Fun(um(i));
    um(i+1) = um(i-1) + h*f;
    
end

figure(2)
hold on; box on;
plot(t,ue,'-r')
plot(t,um,'-b')
plot(t,exp(-t),'-k')
title('Inteveral from [0:20] step size .2','FontSize',14)
legend('Euler Method','Midpoint Method','Exact')
ylabel('u(t)','FontSize',14)
xlabel('t','FontSize',14)

%Part 3 
h = .2/64;
T = 20;
t = t0:h:T+t0;

%Euler's Method

ue = zeros(size(t));
ue(1) = u0;
n = numel(ue);


for i = 1:n-1
    
    f = prob6Fun(ue(i));
    ue(i+1) = ue(i) + h*f;
end

%2-step midpoint method

um = zeros(size(t));
um(1) = u0;
um(2) = exp(-h);
n = numel(um);

for i = 2:n-1
    
    f = prob6Fun(um(i));
    um(i+1) = um(i-1) + h*f;
    
end

figure(3)
hold on; box on;
plot(t,ue,'-r')
plot(t,um,'-b')
plot(t,exp(-t),'-k')
title('Inteveral from [0:20] step size .2/64','FontSize',14)
legend('Euler Method','Midpoint Method','Exact')
ylabel('u(t)','FontSize',14)
xlabel('t','FontSize',14)

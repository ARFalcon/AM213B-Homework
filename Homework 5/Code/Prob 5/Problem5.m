clc; clear; close all;

TF = 3;
dx = .01;
dt = .01;
L = 2;
X = 0:dx:L;
t0 = 0;
T = t0:dt:TF;
NT = numel(T)-1;
N = L/dx;
gl = @(t) cos(2*t);
gr = @(t) sin(2*t);
x0 = .5*X(2:N);
A = diag(ones(N-2,1),-1) + diag(ones(N-2,1),1)+diag(-2*ones(N-1,1));
A = A./dx^2;
b = @(t) [cos(2*t);zeros(N-3,1);sin(2*t)]./dx^2;

[um,tv] = DirkSys(A,b,t0,x0',dt,NT);
um(2:N,:) = um;
um(1,:) = gl(T);
um(N+1,:) = gr(T);

figure(1)
hold on;box on;grid on;

plot(X,um(:,3))
plot(X,um(:,51))
plot(X,um(:,101))
plot(X,um(:,301))
legend('t=.02','t=.5','t=1','t=3')
title('Plot of u(x,t) vs x at different time values')
xlabel('x')
ylabel('u(x,t)')

[um2,tv2] = DirkSys(A,b,t0,x0',dt/2,2*NT);
T2 = t0:dt/2:TF;
um2(2:N,:) = um2;
um2(1,:) = gl(T2);
um2(N+1,:) = gr(T2);

Err_Esti = zeros(N+1,NT+1);
for i = 1:NT+1
    Err_Esti(:,i) = (um(:,i)-um2(:,2*i-1))/(1-(1/2)^2);
end

figure(2)
hold on;box on;grid on;
plot(X,Err_Esti(:,51))
plot(X,Err_Esti(:,101))
plot(X,Err_Esti(:,301))
legend('t=.5','t=1','t=3')
title('Plot of numerical error at different time values')

figure(3)
plot(X,Err_Esti(:,3))
title('Plot of numerical error at t=.02')
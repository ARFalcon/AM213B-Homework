clc; clear; close all;

dx = .01;
dt = [dx^2/2*1/.99,dx^2/2*1/1.01];
X = 0:dx:2;
TF = .2;

for k = 1:2
    T = 0:dt(k):TF;
    NT = numel(T);
    NX = numel(X);
    u = zeros(NX,NT);
    for i = 1:NX
       if X(i)<1
           u(i,1) = 1;
       else
           u(i,1) = 0;
       end
    end


    u(1,:) = 1;
    u(NX,:) = 0;

    r = dt(k)/(dx^2);

    for n = 1:NT-1
        for i = 2:NX-1
            u(i,n+1) = u(i,n) + r*(u(i+1,n)-2*u(i,n)+u(i-1,n));
        end
    end

    figure(k)
    hold on;box on;grid on;
    
    for i = 1:NT
        if T(i) == 0.01
            plot(X,u(:,i))
        elseif T(i) == .04
            plot(X,u(:,i))
        elseif (T(i) <  .09001 && T(i) > .08999)
            plot(X,u(:,i))
        elseif T(i) == .2
            plot(X,u(:,i))
        end
    end
    legend('t=.01','t=.04','t=.09','t=.2')
    title('Plot of u(x,t) vs. x for different t levels')
    xlabel('x')
    ylabel('u(x,t)')
end
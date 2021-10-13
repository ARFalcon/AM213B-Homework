clc; clear; close all;

a = 1- 1/sqrt(2);
T = 30;
t0 = 0;
u0 = 0;
H = zeros(6,1);
for i = 1:6
    H(i) = 1/2^(i+2);
end

f = @(u,t) -1*(.5 + exp(20*cos(1.3*t)))*sinh(u-cos(t));

for j = 1:6
    h = H(j);
    Nstep = T/h;
    %2-step DIRK method
    [wv_D1,tv_D1] = DIRK_solver(f,t0,u0,h,Nstep,a);
    [wv_D2,tv_D2] = DIRK_solver(f,t0,u0,h/2,2*Nstep,a);
    err_D = zeros(Nstep,1);
    for i = 1: Nstep+1
         err_D(i) = abs((wv_D1(i,:)- wv_D2(2*i-1,:))/(1-(.5^2)));
    end
    
    %Backward Euler method
    [wv_BE1,tv_BE1] = back_euler(f,t0,u0,h,Nstep);
    [wv_BE2,tv_BE2] = back_euler(f,t0,u0,h/2,2*Nstep);
    err_BE=zeros(1,Nstep);
    for i = 1:Nstep+1 
        err_BE(i) = abs((wv_BE1(i,:)- wv_BE2(2*i-1,:))/(1-(.5)));
    end
    
    if j == 3
        figure(1)
        hold on; box on;
        set(gca,'YScale','log')
        plot(tv_D1,err_D)
        plot(tv_BE1,err_BE)
        title('Error for 2-step DIRK method and Backwards Euler (h=2^{-5})')
        legend('Error of DIRK','Error of Backwards Euler')
        xlabel('t')
        ylim([10e-14 10])
        hold off;
        
    elseif j == 5
        figure(2)
        hold on; box on;
        set(gca,'YScale','log')
        plot(tv_D1,err_D)
        plot(tv_BE1,err_BE)
        title('Error for 2-step DIRK method and Backwards Euler (h=2^{-7})')
        legend('Error of DIRK','Error of Backwards Euler')
        xlabel('t')
        ylim([10e-14 10])
        hold off;
        
    end
end
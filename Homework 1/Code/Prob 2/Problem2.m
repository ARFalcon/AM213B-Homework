clc; close all; clear;

a = 1;
b = 3;
simp_ans = zeros(10,1);
trap_ans = zeros(10,1);
Error_t = zeros(9,1);
H = zeros(10,1);
Error_s = zeros(9,1);
for i = 2:11
    N = 2^i;
    h = (b-a)/N;
    H(i-1) = h;
    %Trapezoidal rule
    sum_trap = 0;
    for j = 1:N-1
        sum_trap = sum_trap + sqrt(2+cos(a+j*h)^3)*exp((sin(a+j*h)));
    end
    sum_trap = 2*sum_trap + sqrt(2+cos(a)^3)*exp((sin(a))) + sqrt(2+cos(b)^3)*exp((sin(b)));
    sum_trap = sum_trap*h/2;
    trap_ans(i-1) = sum_trap;   
    
    %Simpsons rule
    sum_simp1 = 0;
    sum_simp2 = 0;
    
    for j = 1:N
        sum_simp1 = sum_simp1 + sqrt(2+cos(a+(j-.5)*h)^3)*exp((sin(a+(j-.5)*h)));
    end
    sum_simp1 = sum_simp1*4;
    
    for j = 1:N-1
        sum_simp2 = sum_simp2 + sqrt(2+cos(a+j*h)^3)*exp((sin(a+j*h)));
    end
    sum_simp2 = sum_simp2*2;
    sum_simp = sum_simp1 + sum_simp2 + sqrt(2+cos(a)^3)*exp((sin(a))) + sqrt(2+cos(b)^3)*exp((sin(b)));
    sum_simp = sum_simp*h/6;
    simp_ans(i-1) = sum_simp;
    
    
    
   
end
for i = 1:9
    
    Error_t(i) = abs((trap_ans(i) - trap_ans(i+1))/(1-(1/2^2)));
    Error_s(i) = abs((simp_ans(i) - simp_ans(i+1))/(1-(1/2^4)));

end

figure(1)
hold on
set(gca,'YScale','log','XScale','log')
loglog(H(1:9),Error_t,'-o','MarkerEdgeColor','b','MarkerFaceColor','r','LineWidth',1,'Color','b','MarkerSize',5)
loglog(H(1:9),Error_s,'-s','MarkerEdgeColor','r','MarkerFaceColor','y','LineWidth',1,'Color','r','MarkerSize',5)
xlabel('Size of h','FontSize',14)
ylabel('Numerical error','FontSize',14)
legend('Trapizoidal Rule','Simpsons Rule','Location','southeast','FontSize',14)


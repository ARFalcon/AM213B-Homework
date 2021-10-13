function [MatAns4,MatAns5,EFeh,TimeVec] = Feh45(f,t0,x0,h,N)


p=6;
%
A=[0, 0, 0, 0, 0, 0;
   1/4, 0, 0, 0, 0, 0;
   3/32, 9/32, 0, 0, 0, 0;
   1932/2197, -7200/2197, 7296/2197, 0, 0, 0;
   439/216, -8, 3680/513, -845/4104, 0, 0;
   -8/27, 2, -3544/2565, 1859/4104, -11/40, 0];
%
c=[0,   1/4, 3/8, 12/13,  1,  1/2];
%
b5=[16/135, 0, 6656/12825, 28561/56430, -9/50, 2/55];  % method of order 5 
b4=[25/216, 0, 1408/2565, 2197/4104, -1/5, 0];   % method of order 4


Order = numel(x0);
k = zeros(p,Order);
MatAns4 = zeros(N+1,Order);
MatAns5 = zeros(N+1,Order);
TimeVec = zeros(N+1,1);
MatAns4(1,:) = x0;
MatAns5(1,:) = x0;
TimeVec(1) = t0;
EFeh = zeros(N+1,1);

for i = 1:N
    for j = 1:p
        k(j,:) = h*f(x0+A(j,1:(j-1))*k(1:(j-1),:),t0+c(j)*h);
    end
    temp = x0+b4*k;
    x0 = x0+b5*k;
    t0 = t0+h;
    MatAns5(i+1,:) = x0;
    MatAns4(i+1,:) = temp;
    TimeVec(i+1,:) = t0;
    EFeh(i) = norm(x0-temp)/h;
end
end


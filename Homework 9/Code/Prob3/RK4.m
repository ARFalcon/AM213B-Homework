function [MatAns,TimeVec] = RK4(f,t0,x0,h,N)


p=4; %since RK4

%from lec notes 3
A = [0,0,0,0;.5,0,0,0;0,.5,0,0;0,0,1,0];
c = [0,.5,.5,1];
b = [1/6,1/3,1/3,1/6];


Order = numel(x0);
k = zeros(p,Order);
MatAns = zeros(N+1,Order);
TimeVec = zeros(N+1,1);
MatAns(1,:) = x0;
TimeVec(1) = t0;

for i = 1:N
    for j = 1:p
        k(j,:) = h*f(x0+A(j,1:(j-1))*k(1:(j-1),:),t0+c(j)*h);
    end
    x0 = x0+b*k;
    t0 = t0+h;
    MatAns(i+1,:) = x0;
    TimeVec(i+1,:) = t0;
end
end


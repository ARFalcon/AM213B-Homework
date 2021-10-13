function [XVec,UVec] = FDM_problem5(p,q,r,a,b,alpha,beta,N)

h = (b-a)/(N-.5);
IP = N-1;
x = a+((1:IP)-.5)*h;

pv=p(x);    
qv=q(x);
rv=r(x);

gv=rv;
gv(1)=gv(1) + (1/h - pv(1)/2)*alpha;
gv(IP)=rv(IP)-(1/h^2+(pv(IP))/(2*h))*beta;

A = diag((1/h^2)+(pv(1:IP-1)/2*h),1) + diag(-2/h^2 +qv) +  diag(1/h^2-p(2:IP)/2*h,-1);
A(1,1) = -1/h^2 - p(1)/2*h +qv(1);
u = A\gv';
XVec = [a,x,b]';
UVec = [u(1)-h*alpha;u;beta];

end
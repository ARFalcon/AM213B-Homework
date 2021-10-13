function [XVec,UVec] = FDM(p,q,r,a,b,alpha,beta,N)

h = (b-a)/N;
IP = N-1;
x = a+(1:IP)*h;

pv=p(x);
qv=q(x);
rv=r(x);

gv=rv;
gv(1)=rv(1)-(1/h^2-pv(1)/(2*h))*alpha;
gv(IP)=rv(IP)-(1/h^2+(pv(IP))/(2*h))*beta;

A = diag((1/h^2)+(pv(1:IP-1)/2*h),1) + diag(-2/h^2 +qv) +  diag(1/h^2-p(2:IP)/2*h,-1);
u = A\gv';
XVec = [a,x,b]';
UVec = [alpha;u;beta];

end
function [XVec,UVec] = FDM_problem6(p,q,r,a,b,alpha,beta,N)

h = (b-a)/(N-.5);
IP = N-1;
x = a+((1:IP)-.5)*h;

pv=p(x);    
qv=q(x);
rv=r(x);

gv=rv;
gv(1)=rv(1) - (2-pv(1)*h)/(h*(2+h))*alpha;
gv(IP)=rv(IP)-(1/h^2+(pv(IP))/(2*h))*beta;

A = diag((1/h^2)+(pv(1:IP-1)/2*h),1) + diag(-2/h^2 +qv) +  diag(1/h^2-p(2:IP)/2*h,-1);
A(1,1) = (-4-6*h-2*p(1)*h+p(1)*h^2+q(1)*(2*h^2*(2+h)))/((2+h)*2*h^2);
u = A\gv';
XVec = [a,x,b]';
UVec = [(2*alpha*h+(2-h)*u(1))/(2+h);u;beta];

end
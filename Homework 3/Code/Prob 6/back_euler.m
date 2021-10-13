function [wv ,tv] = back_euler(f,t0,w0,h,Nstep)

wv = zeros(Nstep+1,1);wv(1) = w0;
tv=zeros(Nstep+1,1); tv(1)=t0;

for n = 1:Nstep
    G=@(x) h*f(w0+x, t0+h)-x;
    tol = 1e-12;x0=0;
    [xr,n_iter,flag] = newton_solver(G,x0,tol);
    
    if flag==0
      disp([t0, w0, xr, n_iter, flag])
    end
    
    w0=w0+xr;
    t0=t0+h;
    wv(n+1)=w0;
    tv(n+1)=t0;
    
end
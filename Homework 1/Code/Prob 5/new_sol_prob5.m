function [x] = new_sol_prob5(f,x0,a,at,t,tol)


iter = 0;
err = 1;
h = 10^-5;
max_iter = 10000;

    while err > tol && iter < max_iter

        numDiff = (f(a,at,x0+h,t)-f(a,at,x0-h,t))/(2*h);
        dx = -f(a,at,x0,t)/numDiff;
        err = abs(dx);
        x0 = x0 +dx;
        iter = iter + 1;

    end

x = x0;

end
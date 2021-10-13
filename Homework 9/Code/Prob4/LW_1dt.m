function u = LW_1dt(u,a,b,r,dt)

    m = size(u,2);
    ustar = (u(2:m)+u(1:m-1))/2-r/2*(a(2:m).*u(2:m)-a(1:m-1).*u(1:m-1))+...
        dt/8*(b(2:m)+b(1:m-1)).*(u(2:m)+u(1:m-1));
    u(2:m-1) = u(2:m-1)-r*((a(2:m-1)+a(3:m))/2.*ustar(2:m-1)-(a(2:m-1)+a(1:m-2))/2.*ustar(1:m-2))+...
        dt*b(2:m-1).*(ustar(1:m-2)+ustar(2:m-1))/2;

    u(1) = u(m-1); u(m) = u(2);

end

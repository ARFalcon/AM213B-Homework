clc; clear; close all;

Lx = 8; Ly = 8;

f = @(x,y) 0.*x.*y;
gl = @(y,t) -sin(pi.*y./8).*tanh(2.*t);
gr = @(y,t) -3*sin(pi.*y./8).*tanh(2.*t);
gb = @(x,t) 0.*x*t;
gt = @(x,t) x.*(1-x./8).*tanh(2.*t);

dx = .08; 
dy = .08;
dt = 1.25*10^(-3);
time_save = (20);
NX = Lx/dx; 
NY = Ly/dy;


[x2D,y2D] = meshgrid((0:NX)*dx,(0:NY)*dy);
u2D = f(x2D,y2D);
current_time = 0;
u2D(:,1) = gl((0:NY)*dy,current_time);
u2D(:,NX+1) = gr((0:NX)*dx,current_time);
u2D(1,:) = gb((0:NX)*dx,current_time);
u2D(NY+1,:) = gt((0:NY)*dy,current_time);

n_save = round(time_save/dt);
Err = zeros(n_save(1),1);
Err(1) = 0;
for n = 1:n_save
    
    u2DLast = u2D;
    u2D(2:NY,2:NX) = u2D(2:NY,2:NX)+...
        (dt/dx^2)*(u2D(2:NY,3:NX+1)-2*u2D(2:NY,2:NX)+u2D(2:NY,1:NX-1))...
       +(dt/dy^2)*(u2D(3:NY+1,2:NX)-2*u2D(2:NY,2:NX)+u2D(1:NY-1,2:NX));
    
   current_time = n*dt;
    u2D(1,:) = gb((0:NX)*dx,current_time);
    u2D(:,1) = gl((0:NY)*dy,current_time);
    u2D(:,NX+1) = gr((0:NX)*dx,current_time);
    u2D(NY+1,:) = gt((0:NY)*dy,current_time);
    umax = abs(u2D(2:NY,2:NX)-u2DLast(2:NY,2:NX))/dt;
    Err(n+1)=max(umax,[],'all');

end
T = (0:dt:20);

figure(1)
box on;
plot(T,Err)
set(gca,'YScale','log')
title('E(t) vs. t')
xlabel('t')
ylabel('E(t)')



Lx = 8; Ly = 8;

f = @(x,y) 0.*x.*y;
gl = @(y,t) -sin(pi.*y./8).*tanh(2.*t);
gr = @(y,t) -3*sin(pi.*y./8).*tanh(2.*t);
gb = @(x,t) 0.*x*t;
gt = @(x,t) x.*(1-x./8).*tanh(2.*t);

dx = .16; 
dy = .16;
dt = 1.25*10^(-3);
time_save = (20);
NX = Lx/dx; 
NY = Ly/dy;


[x2D,y2D] = meshgrid((0:NX)*dx,(0:NY)*dy);
u2D2 = f(x2D,y2D);
u2DLast = f(x2D,y2D);
current_time = 0;
u2D2(:,1) = gl((0:NY)*dy,current_time);
u2D2(:,NX+1) = gr((0:NX)*dx,current_time);
u2D2(1,:) = gb((0:NX)*dx,current_time);
u2D2(NY+1,:) = gt((0:NY)*dy,current_time);

NT = size(time_save,2);
u_save = zeros(NY+1,NX+1,NT+1);
TSave = zeros(1,NT+1);
u_save(:,:,1) = u2D2;
save_counter = 1;
n_save = round(time_save/dt);
Err = zeros(n_save(1),1);
Err(1) = 0;
for n = 1:n_save
    
    u2DLast = u2D2;
    u2D2(2:NY,2:NX) = u2D2(2:NY,2:NX)+...
        (dt/dx^2)*(u2D2(2:NY,3:NX+1)-2*u2D2(2:NY,2:NX)+u2D2(2:NY,1:NX-1))...
       +(dt/dy^2)*(u2D2(3:NY+1,2:NX)-2*u2D2(2:NY,2:NX)+u2D2(1:NY-1,2:NX));
    
   current_time = n*dt;
    u2D2(1,:) = gb((0:NX)*dx,current_time);
    u2D2(:,1) = gl((0:NY)*dy,current_time);
    u2D2(:,NX+1) = gr((0:NX)*dx,current_time);
    u2D2(NY+1,:) = gt((0:NY)*dy,current_time);
    umax = abs(u2D2(2:NY,2:NX)-u2DLast(2:NY,2:NX))/dt;
    Err(n+1)=max(umax,[],'all');

end

diff = u2D2-u2D(1:2:2*NY+1,1:2:2*NX+1);
figure(2)
surf((0:dy:Ly),(0:dx:Lx),diff)
title('Numerical difference between (\Deltax,\Deltay) and (2*\Deltax,2*\Deltay)')
xlabel('x')
ylabel('y')
zlabel('numerical difference')

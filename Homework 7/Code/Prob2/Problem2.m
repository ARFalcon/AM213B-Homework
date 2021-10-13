clc; clear; close all;

Lx = 8; Ly = 8;

f = @(x,y) 0.*x.*y;
gl = @(y,t) -2*sin(pi.*y./8).*tanh(2.*t);
gr = @(y,t) 2*sin(pi.*y./8).*tanh(2.*t);
gb = @(x,t) -1*x.*(1-x./8).*tanh(2.*t);
gt = @(x,t) -1*x.*(1-x./8).*tanh(2.*t);

dt = 1.25*10^(-3);
time_save = [0.5,5,10,20];
NX = 100;
NY = 100;
dx = Lx/(NX-0.5); 
dy = Ly/NY;
X = ((0:NX)-0.5)*dx;
[x2D,y2D] = meshgrid((0:NX)*dx,(0:NY)*dy);
u2D = f(x2D,y2D);
u2DLast = f(x2D,y2D);
current_time = 0;
u2D(:,NX+1) = gr((0:NY)*dy,current_time);
u2D(1,:) = gb(X,current_time);
u2D(NY+1,:) = gt(X,current_time);

NT = size(time_save,2);
u_save = zeros(NY+1,NX+1,NT+1);
TSave = zeros(1,NT+1);
u_save(:,:,1) = u2D;
save_counter = 1;
n_save = round(time_save/dt);

for n = 1:n_save(end)
    
    u2D(2:NY,2:NX) = u2D(2:NY,2:NX)+...
        (dt/dx^2)*(u2D(2:NY,3:NX+1)-2*u2D(2:NY,2:NX)+u2D(2:NY,1:NX-1))...
       +(dt/dy^2)*(u2D(3:NY+1,2:NX)-2*u2D(2:NY,2:NX)+u2D(1:NY-1,2:NX));
    
   current_time = n*dt;
    u2D(1,:) = gb(X,current_time);
    u2D(:,1) = u2D(:,2) - dx*gl((0:NY)*dy,current_time)';
    u2D(:,NX+1) = gr((0:NY)*dy,current_time);
    u2D(NY+1,:) = gt(X,current_time);
    
    if n==n_save(save_counter)
        u_save(:,:,save_counter+1) = u2D;
        TSave(save_counter+1) = current_time;
        save_counter = save_counter+1;
    end

end
X = ((0:NX)-0.5)*dx;
Y = (0:NY)*dy;
figure(1)
grid on; hold on; box on;

plot(X,u_save(2/dy,:,2))
plot(X,u_save(2/dy,:,3))
plot(X,u_save(2/dy,:,4))
plot(X,u_save(2/dy,:,5))
legend('t=0.5','t=5','t=10','t=20')
title('Plot of u(x,2) vs x at different times')
xlabel('x')
ylabel('u(x,2)')

figure(2)
surf(X,Y,u_save(:,:,5),'edgecolor','none')
title('u vs (x,y) at T=20')
xlabel('x')
ylabel('y')
zlabel('u(x,y,t)')




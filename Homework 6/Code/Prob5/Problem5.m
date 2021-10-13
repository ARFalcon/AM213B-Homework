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
time_save = [.1,.5,1,2];
NX = Lx/dx; 
NY = Ly/dy;


[x2D,y2D] = meshgrid((0:NX)*dx,(0:NY)*dy);
u2D = f(x2D,y2D);
current_time = 0;
u2D(:,1) = gl((0:NY)*dy,current_time);
u2D(:,NX+1) = gr((0:NX)*dx,current_time);
u2D(1,:) = gb((0:NX)*dx,current_time);
u2D(NY+1,:) = gt((0:NY)*dy,current_time);

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
    u2D(1,:) = gb((0:NX)*dx,current_time);
    u2D(:,1) = gl((0:NY)*dy,current_time);
    u2D(:,NX+1) = gr((0:NX)*dx,current_time);
    u2D(NY+1,:) = gt((0:NY)*dy,current_time);

    if n==n_save(save_counter)
        u_save(:,:,save_counter+1) = u2D;
        TSave(save_counter+1) = current_time;
        save_counter = save_counter+1;
    end
end

plot_n = round(6/dy);

figure(1)
hold on; box on; grid on;
plot((0:NX)*dx,u_save(plot_n,:,2))
plot((0:NX)*dx,u_save(plot_n,:,3))
plot((0:NX)*dx,u_save(plot_n,:,4))
plot((0:NX)*dx,u_save(plot_n,:,5))
legend('t=0.1','t=0.5','t=1','t=2','location','NW')
xlabel('x')
ylabel('u(x,6,t)')
title('plot of u(x,6,t) at different time levels')


figure(2)
hold on; grid on;
surf((0:dx:Lx),(0:dy:Ly),u_save(:,:,5),'edgecolor','none')
xlabel('x')
ylabel('y')
zlabel('u(x,y,2)')
title('surface plot of u(x,y,t) when t=2')
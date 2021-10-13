function sol = MoC(ax,bx,cx,u0x,t,x,h)

vt = @(v,t) [ax(v(1),t),bx(v(1),t)*v(2)+cx(v(1),t)];
N = round(t/h);
[XT] = RK4(ax,t,x,-h,N);
v0 = [XT(end),u0x(XT(end))];
[VT] = RK4(vt,0,v0,h,N);

sol = VT(end);
end

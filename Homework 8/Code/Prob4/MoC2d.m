function sol = MoC2d(a,b,u0x,t,pt,h)

vt = @(w,t) [a(w,t),b(w,t)*w(3)];
N = round(t/h);
[XT] = RK4(a,t,pt,-h,N);
v0 = [XT(end,1),XT(end,2),u0x([XT(end,1),XT(end,2)])];
[VT] = RK4(vt,0,v0,h,N);

sol = VT(end);
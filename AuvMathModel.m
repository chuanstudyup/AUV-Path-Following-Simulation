function Out = AuvMathModel(In)
% In = [u;v;w;p;q;r(rad/s);phi(rad);theta(rad);Xprop(N);MDisturb;NDisturb;Rudder(rad);Elevator(rad)]
% Out = [dotu;dotv;dotw;dotp;dotq;dotr(rad/s/s)]

u = In(1);
v = In(2);
w = In(3);
p = In(4);
q = In(5);
r = In(6);
phi = In(7);
theta = In(8);
Xprop = In(9);
MDisturb = In(10);
NDisturb = In(11);
rudder = In(12);
elevator = In(13);

global auv;

XHS = -(auv.W-auv.B)*sin(theta);
YHS = (auv.W-auv.B)*cos(theta)*sin(phi);
ZHS = (auv.W-auv.B)*cos(theta);cos(phi);
KHS = -(auv.yg*auv.W-auv.yb*auv.B)*cos(theta)*cos(phi)-(auv.zg*auv.W-auv.zb*auv.B)*cos(theta)*sin(phi);
MHS = -(auv.zg*auv.W-auv.zb*auv.B)*sin(theta)-(auv.xg*auv.W-auv.xb*auv.B)*cos(theta);
NHS = -(auv.xg*auv.W-auv.xb*auv.B)*cos(theta)*sin(phi)-(auv.yg*auv.W-auv.yb*auv.B)*cos(theta);

Xsum = XHS+auv.Xuu*u*abs(u)+(auv.Xwq-auv.m)*w*q+(auv.Xqq+auv.m*auv.xg)*q*q+(auv.Xvr+auv.m)*v*r+(auv.Xrr+auv.m*auv.xg)*r*r-auv.m*auv.yg*p*q-auv.m*auv.zg*p*r+Xprop;
Ysum = YHS+auv.Yvv*v*abs(v)+auv.Yrr*r*abs(r)+auv.m*auv.yg*r*r+(auv.Yur-auv.m)*u*r+(auv.Ywp+auv.m)*w*p+(auv.Ypq-auv.m*auv.xg)*p*q+auv.Yuv*u*v+auv.m*auv.yg*p*p+auv.m*auv.zg*q*r+auv.Yuudelta*u*u*rudder;
Zsum = ZHS+auv.Zww*abs(w)*w*+auv.Zqq*abs(q)*q+(auv.Zuq+auv.m)*u*q+(auv.Zvp-auv.m)*v*p+(auv.Zrp-auv.m*auv.xg)*r*p+auv.Zuw*u*w+auv.m*auv.zg*(p*p+q*q)-auv.m*auv.yg*r*q+auv.Zuudelta*u*u*elevator;
Ksum = KHS+auv.Kpp*p*abs(p)-(auv.Izz-auv.Iyy)*q*r-auv.m*auv.zg*(w*p-u*r);%+auv.m*(-v*p)u*q
Msum = MHS+MDisturb+auv.Mww*abs(w)*w+auv.Mqq*abs(q)*q+(auv.Muq-auv.m*auv.xg)*u*q+(auv.Mvp+auv.m*auv.xg)*v*p+(auv.Mrp-(auv.Ixx-auv.Izz))*r*p+auv.m*auv.zg*(v*r-w*q)+auv.Muw*u*w+auv.Muudelta*u*u*elevator;
Nsum = NHS+NDisturb+auv.Nvv*v*abs(v)+auv.Nrr*r*abs(r)+(auv.Nur-auv.m*auv.xg)*u*r+(auv.Nwp+auv.m*auv.xg)*w*p+(auv.Npq-(auv.Iyy-auv.Ixx))*p*q-auv.m*auv.yg*(v*r-w*q)+auv.Nuv*u*v+auv.Nuudelta*u*u*rudder;


Out = auv.Mni*[Xsum;Ysum;Zsum;Ksum;Msum;Nsum];
end
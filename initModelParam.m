global auv;

%《Verification of a six-degree of freedom simulation model for the REMUS autonomous underwater vehicle》

auv.m = 30.51; %kg
auv.W = auv.m*9.8; %N
auv.B = auv.W+6; %N
auv.Ixx = 0.177;
auv.Iyy = 3.45;
auv.Izz = 3.45;

auv.xg = 0; %m
auv.yg = 0;
auv.zg = 0.0196;
auv.xb = 0; %m
auv.yb = 0;
auv.zb = 0;

auv.Xdotu = -0.93;
auv.Xuu = -1.62; %kg/m
auv.Xwq = -35.5;
auv.Xqq = -0.2693;
auv.Xvr = 35.5;
auv.Xrr = -1.93;

auv.Ydotv = -35.5;
auv.Ydotr = 1.93;
auv.Yvv = -131;
auv.Yrr = 0.632;
auv.Yur = 5.22;
auv.Ywp = 35.5;
auv.Ypq = 1.93;
auv.Yuv = -28.6;
auv.Yuudelta = -9.64; %右转舵为正

auv.Zdotw = -35.5;
auv.Zdotq = -1.93;
auv.Zww = -131;
auv.Zqq = -0.632;
auv.Zuq = -5.22;
auv.Zvp = -35.5;
auv.Zrp = 1.93;
auv.Zuw = -28.6;
auv.Zuudelta = -9.64; %艉下潜舵 为 正舵角

auv.Kdotp = -0.0013;
auv.Kpp = -0.0141;

auv.Mdotw = -1.93;
auv.Mdotq = -4.88;
auv.Mww = 3.18;
auv.Mqq = -9.4;
auv.Muq = -2;
auv.Mvp = -1.93;
auv.Mrp = 4.86;
auv.Muw = 2.4;
auv.Muudelta = -6.15;

auv.Ndotv = 1.93;
auv.Ndotr = -4.88;
auv.Nvv = -3.18;
auv.Nrr = -9.4;
auv.Nur = -2;
auv.Nwp = -1.93;
auv.Npq = -4.86;
auv.Nuv = -2.5; 
auv.Nuudelta = 6.15;

auv.M = [auv.m-auv.Xdotu,0,0,0,auv.m*auv.zg,-auv.m*auv.yg;
    0,auv.m-auv.Ydotv,0,-auv.m*auv.zg,0,auv.m*auv.xg-auv.Ydotr;
    0,0,auv.m-auv.Zdotw,auv.m*auv.yg,-auv.m*auv.xg-auv.Zdotq,0;
    0,-auv.m*auv.zg,auv.m*auv.yg,auv.Ixx-auv.Kdotp,0,0;
    auv.m*auv.zg,0,-auv.m*auv.xg-auv.Mdotw,0,auv.Iyy-auv.Mdotq,0;
    -auv.m*auv.yg,auv.m*auv.xg-auv.Ndotv,0,0,0,auv.Izz-auv.Ndotr];
auv.Mni = auv.M^-1;
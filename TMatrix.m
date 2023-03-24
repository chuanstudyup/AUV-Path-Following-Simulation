function Out = TMatrix(In)
% In = [p;q;r(rad/s);phi;theta;psi(rad)]
phi = In(4);
theta = In(5);

T = [1,sin(phi)*tan(theta),cos(phi)*tan(theta);
    0,cos(phi),-sin(phi);
    0,sin(phi)/cos(theta),cos(phi)/cos(theta)];
Out = T*In(1:3);
end
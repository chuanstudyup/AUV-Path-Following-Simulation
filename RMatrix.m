function Out = RMatrix(In)
% In = [u;v;w(m/s);phi;theta;psi(rad)]
phi = In(4);
theta = In(5);
psi = In(6);

R_bn = [cos(psi)*cos(theta),-sin(psi)*cos(phi)+cos(psi)*sin(theta)*sin(phi),sin(psi)*sin(phi)+cos(psi)*cos(phi)*sin(theta);
    sin(psi)*cos(theta),cos(psi)*cos(phi)+sin(phi)*sin(theta)*sin(psi),-cos(psi)*sin(phi)+sin(theta)*sin(psi)*cos(phi);
    -sin(theta),cos(theta)*sin(phi),cos(theta)*cos(phi)];

Out = R_bn*In(1:3);
end
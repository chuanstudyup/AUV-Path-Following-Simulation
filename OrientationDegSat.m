function u = OrientationDegSat(in)
if in > 360
    u = in - 360;
elseif in<0
    u = in+360;
else
    u = in;
end
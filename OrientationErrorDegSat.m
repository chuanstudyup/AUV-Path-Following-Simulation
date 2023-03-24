function u = OrientationErrorDegSat(in)
if in > 180
    u = in - 360;
elseif in<-180
    u = in+360;
else
    u = in;
end
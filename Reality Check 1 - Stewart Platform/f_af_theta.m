%{
Fall sem er 0 þegar við setjum inn gildi sem ganga upp en eitthvað annað,
annars fæst eitthvað annað en 0.
%}

function [f, x, y]= f_af_theta(p1,p2,p3,L1,L2,L3,x1,x2,y2,theta,gamma) 

A2 = L3*cos(theta)-x1;
B2 = L3*sin(theta);
A3 = L2*cos(theta + gamma)-x2;
B3 = L2*sin(theta + gamma)-y2;
D = 2*(A2*B3-B2*A3);

N1 = (B3*(p2^2-p1^2-A2^2-B2^2)-B2*(p3^2-p1^2-A3^2-B3^2));
N2 = (-A3*(p2^2-p1^2-A2^2-B2^2)+A2*(p3^2-p1^2-A3^2-B3^2));    
f = N1^2 + N2^2 - p1^2*D^2;
x = N1/D;
y = N2/D;
end

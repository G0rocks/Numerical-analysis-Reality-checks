%{
�etta er fall sem tekur inn x,y,theta, gamma, L2 og L3
  N�mer hornpunkts er �a� sama og n�mer sto�ar svo hornpunktur 3 er s� punktur
  sem er tengdur stoð p3
Falli� skilar svo x og y hniti hvers hornpunkts � vigurforminu
  [xhorn2,yhorn2,xhorn3,yhorn3]
En xhorn1 = x og yhorn1 = y er satt
%}

function [xhorn2,yhorn2,xhorn3,yhorn3] = thrihyrningur (x, y, theta, gamma, L2, L3)
  xhorn2 = x+L3*cos(theta);
  yhorn2 = y+L3*sin(theta);
  xhorn3 = x+L2*cos(theta+gamma);
  yhorn3 = y+L2*sin(theta+gamma);
end

%{
Þetta er fall sem tekur inn x,y,theta, gamma, L2 og L3
  Númer hornpunkts er það sama og númer stoðar svo hornpunktur 3 er sá punktur
  sem er tengdur stoð p3
Fallið skilar svo x og y hniti hvers hornpunkts á vigurforminu
  [xhorn2,yhorn2,xhorn3,yhorn3]
En xhorn1 = x og yhorn1 = y er satt
%}

function [xhorn2,yhorn2,xhorn3,yhorn3] = thrihyrningur (x, y, theta, gamma, L2, L3)
  xhorn2 = x+L3*cos(theta);
  yhorn2 = y+L3*sin(theta);
  xhorn3 = x+L2*cos(theta+gamma);
  yhorn3 = y+L2*sin(theta+gamma);
endfunction

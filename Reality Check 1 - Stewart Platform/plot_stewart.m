%{
Fall sem plottar Stewart myndina á það plot sem er nú valið fyrir gefin gildi

%}

function plot_stewart (x1, x2, y2, theta, gamma, p1, p2, p3, L1, L2, L3)
  y1 = 0;
  
  [f,x,y] = f_af_theta(p1,p2,p3,L1,L2,L3,x1,x2,y2,theta,gamma);
  [xhorn2,yhorn2,xhorn3,yhorn3] = thrihyrningur (x, y, theta, gamma, L2, L3); % Finnum hornpunkta þríhyrnings

  plot([x xhorn2 xhorn3 x],[y yhorn2 yhorn3 y],'r'); % þríhyrningur plot

  hold on % Bætum við öðru plotti ofan á það plot á þeirri mynd í þeim ramma sem við erum í
  plot([0 x1 x2 x xhorn2 xhorn3],[0 y1 y2 y yhorn2 yhorn3], 'bo', 'MarkerFaceColor', 'b') % Teikna hvern punkt sem bláan bolta
  plot([0 x],[0 y],'b') % Stoð 1, p1
  plot([x1 xhorn2],[y1 yhorn2],'b') % Stoð 2, p2
  plot([x2 xhorn3],[y2 yhorn3],'b') % Stoð 3, p3
end

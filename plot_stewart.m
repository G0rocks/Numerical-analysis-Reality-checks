%{
Fall sem plottar Stewart myndina � �a� plot sem er n� vali� fyrir gefin gildi

%}

function plot_stewart (x1, x2, y2, theta, gamma, p1, p2, p3, L1, L2, L3)
  y1 = 0;
  
  [f,x,y] = f_af_theta(p1,p2,p3,L1,L2,L3,x1,x2,y2,theta,gamma);
  [xhorn2,yhorn2,xhorn3,yhorn3] = thrihyrningur (x, y, theta, gamma, L2, L3); % Finnum hornpunkta �r�hyrnings

  plot([x xhorn2 xhorn3 x],[y yhorn2 yhorn3 y],'r'); % �r�hyrningur plot

  hold on % B�tum vi� ��ru plotti ofan � �a� plot � �eirri mynd � �eim ramma sem vi� erum �
  plot([0 x1 x2 x xhorn2 xhorn3],[0 y1 y2 y yhorn2 yhorn3], 'bo', 'MarkerFaceColor', 'b') % Teikna hvern punkt sem bl�an bolta
  plot([0 x],[0 y],'b') % Sto� 1, p1
  plot([x1 xhorn2],[y1 yhorn2],'b') % Sto� 2, p2
  plot([x2 xhorn3],[y2 yhorn3],'b') % Sto� 3, p3
end

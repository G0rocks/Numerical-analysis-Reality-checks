clear all
format short
clc

% Lidur 1 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Vid skilgreindum fallid f_af_theta sem tekur inn eftirfarandi breytur i %
% rettri rod:                                                             %
% p1,p2,p3,L1,L2,L3,x1,x2,y2,theta,gamma                                  %
% Fallid skilar gildum F,x og y (skyrt i verkskyrslu).                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
disp(' ')
disp('Lidur 1:')
disp('--------------------------------')
disp('(Sja forrit f_af_theta.m i skyrslu)')
disp(' ')

p1 = sqrt(5); p2 = sqrt(5); p3 = sqrt(5);
L1 = 2; L2 = sqrt(2); L3 = sqrt(2);
x1 = 4; y1 = 0; x2 = 0; y2 = 4;

gamma = pi/2;

disp('Ef allt gengur a� �skum �ttu n�stu tv�r ni�urst��ur a� vera 0')
theta = - pi/4;
disp(strcat('f(-pi/4) =  ', num2str(f_af_theta(p1,p2,p3,L1,L2,L3,x1,x2,y2,theta,gamma))))
theta = pi/4;
disp(strcat('f(pi/4) =  ',num2str(f_af_theta(p1,p2,p3,L1,L2,L3,x1,x2,y2,theta,gamma))))

% Lidur 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp(' ')
disp('Lidur 2:')
disp('--------------------------------')
disp('(Sja mynd 1)')
disp(' ') 

syms theta;
figure(1)
ezplot(f_af_theta(p1,p2,p3,L1,L2,L3,x1,x2,y2,theta,gamma),[-pi,pi])
clear theta

% Lidur 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp(' ')
disp('Lidur 3:')
disp('--------------------------------')
disp('(Sja mynd 2)')
disp(' ')

% a)
%----------------------------------------------------%
theta = -pi/4;
gamma = pi/2;
[f,x,y] = f_af_theta(p1,p2,p3,L1,L2,L3,x1,x2,y2,theta,gamma);

figure(2);
subplot(1,2,1)
plot([x x+L2*cos(theta+gamma) x+L3*cos(theta) x],...
    [y y+L2*sin(theta+gamma) y+L3*sin(theta) y],'r');
hold on
plot([0 x1 x2 x x+L2*cos(theta+gamma) x+L3*cos(theta)],...
    [0 0 y2 y y+L2*sin(theta+gamma) y+L3*sin(theta)],...
    'bo', 'MarkerFaceColor', 'b')
plot([0 x],[0 y],'b')
plot([x2 x+L2*cos(theta+gamma)],[y2 y+L2*sin(theta+gamma)],'b')
plot([x1 x+L3*cos(theta)],[y1 y+L3*sin(theta)],'b')

axis([0 4.5 0 4.5])
xlabel('(a)');
pbaspect([1 1 1])
set(gca, 'box', 'off')


% b)
%----------------------------------------------------%
subplot(1,2,2)
theta = pi/4;
[f,x,y] = f_af_theta(p1,p2,p3,L1,L2,L3,x1,x2,y2,theta,gamma);

plot([x x+L2*cos(theta+gamma) x+L3*cos(theta) x],...
    [y y+L2*sin(theta+gamma) y+L3*sin(theta) y],'r');
hold on
plot([0 x1 x2 x x+L2*cos(theta+gamma) x+L3*cos(theta)],...
    [0 0 y2 y y+L2*sin(theta+gamma) y+L3*sin(theta)],...
    'bo', 'MarkerFaceColor', 'b')
plot([0 x],[0 y],'b')
plot([x2 x+L2*cos(theta+gamma)],[y2 y+L2*sin(theta+gamma)],'b')
plot([x1 x+L3*cos(theta)],[y1 y+L3*sin(theta)],'b')

axis([0 4.5 0 4.5])
xlabel('(b)');
pbaspect([1 1 1])
set(gca, 'box', 'off')

 
% Lidur 4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp(' ')
disp('Lidur 4:')
disp('--------------------------------')
disp('(Sja myndir 3 og 4)')
disp(' ')

p1 = 5; p2 = 5; p3 = 3;
x1 = 5; y1 = 0; 
x2 = 0; y2 = 6;
L1 = 3; L2 = 3*sqrt(2); L3 = 3;
gamma = pi/4;
syms theta;
[f, x, y] = f_af_theta(p1,p2,p3,L1,L2,L3,x1,x2,y2,theta,gamma);
figure(3);
ezplot(f,[-pi,pi])


% Skrifum litid rotaleitarforrit:
%----------------------------------------------------%
raetur = [];
range = [-4 -3;-3 -2;-2 -1;-1 0; 0 1;1 2;2 3;3 4];
telja_raetur = 0;

for k = 1:8
   rot = double(vpasolve(f,theta,range(k)));
   if (~ismember(rot,raetur) && -pi < rot && rot < pi)
       telja_raetur = telja_raetur + 1;
       raetur(telja_raetur) = rot;
   end
end
%----------------------------------------------------%


% 
% a)
% ----------------------------------------------------%
theta = raetur(1);
[f,x,y] = f_af_theta(p1,p2,p3,L1,L2,L3,x1,x2,y2,theta,gamma);

figure(4);
subplot(2,2,1)
plot([x x+L2*cos(theta+gamma) x+L3*cos(theta) x],...
    [y y+L2*sin(theta+gamma) y+L3*sin(theta) y],'r');
hold on
plot([0 x1 x2 x x+L2*cos(theta+gamma) x+L3*cos(theta)],...
    [0 0 y2 y y+L2*sin(theta+gamma) y+L3*sin(theta)],...
    'bo', 'MarkerFaceColor', 'b')
plot([0 x],[0 y],'b')
plot([x2 x+L2*cos(theta+gamma)],[y2 y+L2*sin(theta+gamma)],'b')
plot([x1 x+L3*cos(theta)],[y1 y+L3*sin(theta)],'b')

axis([-2 8 -2 8])
xlabel('(a)');
pbaspect([1 1 1])
set(gca, 'box', 'off')

[a_test_p1 a_test_p2 a_test_p3] = test_p(x,y,L1,L2,L3,x1,x2,y2,theta,gamma);

%b)
%----------------------------------------------------%
subplot(2,2,2)
theta = raetur(2);
[f,x,y] = f_af_theta(p1,p2,p3,L1,L2,L3,x1,x2,y2,theta,gamma);

plot([x x+L2*cos(theta+gamma) x+L3*cos(theta) x],...
    [y y+L2*sin(theta+gamma) y+L3*sin(theta) y],'r');
hold on
plot([0 x1 x2 x x+L2*cos(theta+gamma) x+L3*cos(theta)],...
    [0 0 y2 y y+L2*sin(theta+gamma) y+L3*sin(theta)],...
    'bo', 'MarkerFaceColor', 'b')
plot([0 x],[0 y],'b')
plot([x2 x+L2*cos(theta+gamma)],[y2 y+L2*sin(theta+gamma)],'b')
plot([x1 x+L3*cos(theta)],[y1 y+L3*sin(theta)],'b')

axis([-2 8 -2 8])
xlabel('(b)');
pbaspect([1 1 1])
set(gca, 'box', 'off')

[b_test_p1 b_test_p2 b_test_p3] = test_p(x,y,L1,L2,L3,x1,x2,y2,theta,gamma);



% c)
%----------------------------------------------------%
subplot(2,2,3)
theta = raetur(3);
[f,x,y] = f_af_theta(p1,p2,p3,L1,L2,L3,x1,x2,y2,theta,gamma);

plot([x x+L2*cos(theta+gamma) x+L3*cos(theta) x],...
    [y y+L2*sin(theta+gamma) y+L3*sin(theta) y],'r');
hold on
plot([0 x1 x2 x x+L2*cos(theta+gamma) x+L3*cos(theta)],...
    [0 0 y2 y y+L2*sin(theta+gamma) y+L3*sin(theta)],...
    'bo', 'MarkerFaceColor', 'b')
plot([0 x],[0 y],'b')
plot([x2 x+L2*cos(theta+gamma)],[y2 y+L2*sin(theta+gamma)],'b')
plot([x1 x+L3*cos(theta)],[y1 y+L3*sin(theta)],'b')

axis([-2 8 -2 8])
xlabel('(c)');
pbaspect([1 1 1])
set(gca, 'box', 'off')

[c_test_p1 c_test_p2 c_test_p3] = test_p(x,y,L1,L2,L3,x1,x2,y2,theta,gamma);

 
% d)
%----------------------------------------------------%
subplot(2,2,4)
theta = raetur(4);
[f,x,y] = f_af_theta(p1,p2,p3,L1,L2,L3,x1,x2,y2,theta,gamma);

plot([x x+L2*cos(theta+gamma) x+L3*cos(theta) x],...
    [y y+L2*sin(theta+gamma) y+L3*sin(theta) y],'r');
hold on
plot([0 x1 x2 x x+L2*cos(theta+gamma) x+L3*cos(theta)],...
    [0 0 y2 y y+L2*sin(theta+gamma) y+L3*sin(theta)],...
    'bo', 'MarkerFaceColor', 'b')
plot([0 x],[0 y],'b')
plot([x2 x+L2*cos(theta+gamma)],[y2 y+L2*sin(theta+gamma)],'b')
plot([x1 x+L3*cos(theta)],[y1 y+L3*sin(theta)],'b')

axis([-2 8 -2 8])
xlabel('(d)');
pbaspect([1 1 1])
set(gca, 'box', 'off')

[d_test_p1 d_test_p2 d_test_p3] = test_p(x,y,L1,L2,L3,x1,x2,y2,theta,gamma);


disp(strcat('Fyrir θ = ', num2str(raetur(1)), ' Faum vid:'))
disp(strcat('p1 = ', num2str(a_test_p1), ', p2 = ', num2str(a_test_p2),' og p3 = ', num2str(a_test_p3)))
disp(' ')
disp(strcat('Fyrir θ = ', num2str(raetur(2)), ' Faum vid:'))
disp(strcat('p1 = ', num2str(b_test_p1), ', p2 = ', num2str(b_test_p2), ' og p3 = ', num2str(b_test_p3)))
disp(' ')
disp(strcat('Fyrir θ = ', num2str(raetur(3)), ' Faum vid:'))
disp(strcat('p1 = ', num2str(c_test_p1), ', p2 = ', num2str(c_test_p2), ' og p3 = ', num2str(c_test_p3)))
disp(' ')
disp(strcat('Fyrir θ = ', num2str(raetur(4)), ' Faum vid:'))
disp(strcat('p1 = ', num2str(d_test_p1), ', p2 = ', num2str(d_test_p2), ' og p3 = ', num2str(d_test_p3)))
disp(' ')

% Lidur 5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp(' ')
disp('Lidur 5:')
disp('--------------------------------')
disp('(Sja myndir 5 og 6)')
disp(' ')

p2 = 7;
syms theta;
[f, x, y] = f_af_theta(p1,p2,p3,L1,L2,L3,x1,x2,y2,theta,gamma);
figure(5);
ezplot(f,[-pi,pi])


% Skrifum litid rotaleitarforrit:
%----------------------------------------------------%

% Sjaum hvar raetur liggja af grafi
rotabil = [-1 -0.5;-0.38 -0.35;0 0.1;0.4 0.5;0.96 1;2.5 2.55];
raetur5 = [];
for k = 1:6
   raetur5(k) = vpasolve(f,theta,rotabil(k));
end

%----------------------------------------------------%


%a)
%----------------------------------------------------%
theta = raetur5(1);
[f,x,y] = f_af_theta(p1,p2,p3,L1,L2,L3,x1,x2,y2,theta,gamma);

figure(6);
subplot(3,2,1)
plot([x x+L2*cos(theta+gamma) x+L3*cos(theta) x],...
    [y y+L2*sin(theta+gamma) y+L3*sin(theta) y],'r');
hold on
plot([0 x1 x2 x x+L2*cos(theta+gamma) x+L3*cos(theta)],...
    [0 0 y2 y y+L2*sin(theta+gamma) y+L3*sin(theta)],...
    'bo', 'MarkerFaceColor', 'b')
plot([0 x],[0 y],'b')
plot([x2 x+L2*cos(theta+gamma)],[y2 y+L2*sin(theta+gamma)],'b')
plot([x1 x+L3*cos(theta)],[y1 y+L3*sin(theta)],'b')

axis([-6 6 -2 10])
xlabel('(a)');
pbaspect([1 1 1])
set(gca, 'box', 'off')

[a_test_p1 a_test_p2 a_test_p3] = test_p(x,y,L1,L2,L3,x1,x2,y2,theta,gamma);

% b)
%----------------------------------------------------%
subplot(3,2,2)
theta = raetur5(2);
[f,x,y] = f_af_theta(p1,p2,p3,L1,L2,L3,x1,x2,y2,theta,gamma);

plot([x x+L2*cos(theta+gamma) x+L3*cos(theta) x],...
    [y y+L2*sin(theta+gamma) y+L3*sin(theta) y],'r');
hold on
plot([0 x1 x2 x x+L2*cos(theta+gamma) x+L3*cos(theta)],...
    [0 0 y2 y y+L2*sin(theta+gamma) y+L3*sin(theta)],...
    'bo', 'MarkerFaceColor', 'b')
plot([0 x],[0 y],'b')
plot([x2 x+L2*cos(theta+gamma)],[y2 y+L2*sin(theta+gamma)],'b')
plot([x1 x+L3*cos(theta)],[y1 y+L3*sin(theta)],'b')

axis([-6 6 -2 10])
xlabel('(b)');
pbaspect([1 1 1])
set(gca, 'box', 'off')

[b_test_p1 b_test_p2 b_test_p3] = test_p(x,y,L1,L2,L3,x1,x2,y2,theta,gamma);



% c)
%----------------------------------------------------%
subplot(3,2,3)
theta = raetur5(3);
[f,x,y] = f_af_theta(p1,p2,p3,L1,L2,L3,x1,x2,y2,theta,gamma);

plot([x x+L2*cos(theta+gamma) x+L3*cos(theta) x],...
    [y y+L2*sin(theta+gamma) y+L3*sin(theta) y],'r');
hold on
plot([0 x1 x2 x x+L2*cos(theta+gamma) x+L3*cos(theta)],...
    [0 0 y2 y y+L2*sin(theta+gamma) y+L3*sin(theta)],...
    'bo', 'MarkerFaceColor', 'b')
plot([0 x],[0 y],'b')
plot([x2 x+L2*cos(theta+gamma)],[y2 y+L2*sin(theta+gamma)],'b')
plot([x1 x+L3*cos(theta)],[y1 y+L3*sin(theta)],'b')

axis([-6 6 -2 10])
xlabel('(c)');
pbaspect([1 1 1])
set(gca, 'box', 'off')

[c_test_p1 c_test_p2 c_test_p3] = test_p(x,y,L1,L2,L3,x1,x2,y2,theta,gamma);

 
% d)
%----------------------------------------------------%
subplot(3,2,4)
theta = raetur5(4);
[f,x,y] = f_af_theta(p1,p2,p3,L1,L2,L3,x1,x2,y2,theta,gamma);

plot([x x+L2*cos(theta+gamma) x+L3*cos(theta) x],...
    [y y+L2*sin(theta+gamma) y+L3*sin(theta) y],'r');
hold on
plot([0 x1 x2 x x+L2*cos(theta+gamma) x+L3*cos(theta)],...
    [0 0 y2 y y+L2*sin(theta+gamma) y+L3*sin(theta)],...
    'bo', 'MarkerFaceColor', 'b')
plot([0 x],[0 y],'b')
plot([x2 x+L2*cos(theta+gamma)],[y2 y+L2*sin(theta+gamma)],'b')
plot([x1 x+L3*cos(theta)],[y1 y+L3*sin(theta)],'b')

axis([-6 6 -2 10])
xlabel('(d)');
pbaspect([1 1 1])
set(gca, 'box', 'off')

[d_test_p1 d_test_p2 d_test_p3] = test_p(x,y,L1,L2,L3,x1,x2,y2,theta,gamma);

% e)
%----------------------------------------------------%
subplot(3,2,5)
theta = raetur5(5);
[f,x,y] = f_af_theta(p1,p2,p3,L1,L2,L3,x1,x2,y2,theta,gamma);

plot([x x+L2*cos(theta+gamma) x+L3*cos(theta) x],...
    [y y+L2*sin(theta+gamma) y+L3*sin(theta) y],'r');
hold on
plot([0 x1 x2 x x+L2*cos(theta+gamma) x+L3*cos(theta)],...
    [0 0 y2 y y+L2*sin(theta+gamma) y+L3*sin(theta)],...
    'bo', 'MarkerFaceColor', 'b')
plot([0 x],[0 y],'b')
plot([x2 x+L2*cos(theta+gamma)],[y2 y+L2*sin(theta+gamma)],'b')
plot([x1 x+L3*cos(theta)],[y1 y+L3*sin(theta)],'b')

axis([-6 6 -2 10])
xlabel('(d)');
pbaspect([1 1 1])
set(gca, 'box', 'off')

[e_test_p1 e_test_p2 e_test_p3] = test_p(x,y,L1,L2,L3,x1,x2,y2,theta,gamma);

% f)
%----------------------------------------------------%
subplot(3,2,6)
theta = raetur5(6);
[f,x,y] = f_af_theta(p1,p2,p3,L1,L2,L3,x1,x2,y2,theta,gamma);

plot([x x+L2*cos(theta+gamma) x+L3*cos(theta) x],...
    [y y+L2*sin(theta+gamma) y+L3*sin(theta) y],'r');
hold on
plot([0 x1 x2 x x+L2*cos(theta+gamma) x+L3*cos(theta)],...
    [0 0 y2 y y+L2*sin(theta+gamma) y+L3*sin(theta)],...
    'bo', 'MarkerFaceColor', 'b')
plot([0 x],[0 y],'b')
plot([x2 x+L2*cos(theta+gamma)],[y2 y+L2*sin(theta+gamma)],'b')
plot([x1 x+L3*cos(theta)],[y1 y+L3*sin(theta)],'b')

axis([-6 6 -2 10])
xlabel('(d)');
pbaspect([1 1 1])
set(gca, 'box', 'off')

[f_test_p1 f_test_p2 f_test_p3] = test_p(x,y,L1,L2,L3,x1,x2,y2,theta,gamma);


% Lidur 6
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp(' ')
disp('Lidur 6:')
disp('--------------------------------')
disp(' ')

disp(strcat('Fyrir θ = ', num2str(raetur5(1)), ' Faum vid:'))
disp(strcat('p1 = ', num2str(a_test_p1) + ', p2 = ', num2str(a_test_p2), ' og p3 = ', num2str(a_test_p3)))
disp(' ')
disp(strcat('Fyrir θ = ', num2str(raetur5(2)), ' Faum vid:'))
disp(strcat('p1 = ', num2str(b_test_p1) + ', p2 = ', num2str(b_test_p2), ' og p3 = ', num2str(b_test_p3)))
disp(' ')
disp(strcat('Fyrir θ = ', num2str(raetur5(3)), ' Faum vid:'))
disp(strcat('p1 = ', num2str(c_test_p1), ', p2 = ', num2str(c_test_p2), ' og p3 = ', num2str(c_test_p3)))
disp(' ')
disp(strcat('Fyrir θ = ', num2str(raetur5(4)), ' Faum vid:'))
disp(strcat('p1 = ', num2str(d_test_p1), ', p2 = ', num2str(d_test_p2), ' og p3 = ', num2str(d_test_p3)))
disp(' ')
disp(strcat('Fyrir θ = ', num2str(raetur5(5)), ' Faum vid:'))
disp(strcat('p1 = ', num2str(e_test_p1), ', p2 = ' + num2str(e_test_p2), ' og p3 = ', num2str(e_test_p3)))
disp(' ')
disp(strcat('Fyrir θ = ', num2str(raetur5(6)), ' Faum vid:'))
disp(strcat('p1 = ', num2str(f_test_p1), ', p2 = ', num2str(f_test_p2), ' og p3 = ', num2str(f_test_p3)))


% pkg load symbolic
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

disp('Ef allt gengur að óskum ættu næstu tvær niðurstöður að vera 0')
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
disp('Sömu gildi og áðan svo rætur eru þær sömu, þurfum því ekki að athuga rætur aftur')

syms theta;
figure(1)
ezplot(f_af_theta(p1,p2,p3,L1,L2,L3,x1,x2,y2,theta,gamma),[-pi,pi]) % Plottum f á [-pi, pi]
clear theta

% Lidur 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp(' ')
disp('Lidur 3:')
disp('--------------------------------')
disp('(Sja mynd 2)')
disp(' ')

% a) Teiknar mynd a) í fig 1.15
%----------------------------------------------------%
theta = -pi/4;
gamma = pi/2;
[f,x,y] = f_af_theta(p1,p2,p3,L1,L2,L3,x1,x2,y2,theta,gamma);

figure(2);  % Rammi 2
subplot(1,2,1) % 2 myndir í 1*2 grid, fiktum í mynd 1
plot_stewart (x1, x2, y2, theta, gamma, p1, p2, p3, L1, L2, L3) % Plotta Stewart mynd

axis([0 4.5 0 4.5])
xlabel('(a)');
pbaspect([1 1 1])
set(gca, 'box', 'off')


% b) Teiknar mynd b) í fig 1.15
%----------------------------------------------------%
subplot(1,2,2) % 2 myndir í 1*2 grid, fiktum í mynd 2
theta = pi/4;
[f,x,y] = f_af_theta(p1,p2,p3,L1,L2,L3,x1,x2,y2,theta,gamma); % Finna ný gildi á f, x, y

plot_stewart (x1, x2, y2, theta, gamma, p1, p2, p3, L1, L2, L3) % Plotta Stewart mynd

axis([0 4.5 0 4.5])
xlabel('(b)');
pbaspect([1 1 1])
set(gca, 'box', 'off')

 
% Lidur 4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Eigum að finna stöðu platforms (x,y,theta) fyrir gefnar lengdir á stoðum (p1,p2,p3)
disp(' ')
disp('Lidur 4:')
disp('--------------------------------')
disp('(Sja myndir 3, plot af f, og 4, stöðurnar 4 sem uppfylla skilyrðin)')
disp(' ')

% Setjum inn ný gildi á breytum
p1 = 5; p2 = 5; p3 = 3;
x1 = 5; y1 = 0; 
x2 = 0; y2 = 6;
L1 = 3; L2 = 3*sqrt(2); L3 = 3;
gamma = pi/4;
syms theta;
[f, x, y] = f_af_theta(p1,p2,p3,L1,L2,L3,x1,x2,y2,theta,gamma);
figure(3);
ezplot(f,[-pi,pi]) % Plottum f á [-pi, pi]


% Skrifum litid rotaleitarforrit:
%----------------------------------------------------%
raetur = [];
range = [-4 -3;-3 -2;-2 -1;-1 0; 0 1;1 2;2 3;3 4];  % Skoðum nokkur bil af lengd 1 sem innihalda [-pi, pi]
telja_raetur = 0;

% Litla rótaleitarforritið
for k = 1:8
   rot = double(vpasolve(f,theta,range(k)));  % Finnur rót fyrir gefið all á gefnu bilinu
   if (~ismember(rot,raetur) && -pi < rot && rot < pi)  % Ef rótin er ekki duplicate og er á bilinu [-pi, pi] bætum við henni við
       telja_raetur = telja_raetur + 1;
       raetur(telja_raetur) = rot;
   end
end
%----------------------------------------------------%


% 
% a) Teikna eina af fjórum stöðum á mynd a) í ramma 4
% ----------------------------------------------------%
theta = raetur(1);
[f,x,y] = f_af_theta(p1,p2,p3,L1,L2,L3,x1,x2,y2,theta,gamma);

figure(4); % Rammi 4
subplot(2,2,1) % Mynd 1 í 2x2 grid
plot_stewart (x1, x2, y2, theta, gamma, p1, p2, p3, L1, L2, L3) % Plotta Stewart mynd

axis([-2 8 -2 8])
xlabel('(a)');
pbaspect([1 1 1])
set(gca, 'box', 'off')

[a_test_p1 a_test_p2 a_test_p3] = test_p(x,y,L1,L2,L3,x1,x2,y2,theta,gamma);

%b) Teikna eina af fjórum stöðum á mynd b) í ramma 4
%----------------------------------------------------%
subplot(2,2,2) % Mynd 2 í 2x2 grid
theta = raetur(2);
[f,x,y] = f_af_theta(p1,p2,p3,L1,L2,L3,x1,x2,y2,theta,gamma);

plot_stewart (x1, x2, y2, theta, gamma, p1, p2, p3, L1, L2, L3) % Plotta Stewart mynd

axis([-2 8 -2 8])
xlabel('(b)');
pbaspect([1 1 1])
set(gca, 'box', 'off')

[b_test_p1 b_test_p2 b_test_p3] = test_p(x,y,L1,L2,L3,x1,x2,y2,theta,gamma);



% c) Teikna eina af fjórum stöðum á mynd c) í ramma 4
%----------------------------------------------------%
subplot(2,2,3) % Mynd 3 í 2x2 grid
theta = raetur(3);
[f,x,y] = f_af_theta(p1,p2,p3,L1,L2,L3,x1,x2,y2,theta,gamma);

plot_stewart (x1, x2, y2, theta, gamma, p1, p2, p3, L1, L2, L3) % Plotta Stewart mynd

axis([-2 8 -2 8])
xlabel('(c)');
pbaspect([1 1 1])
set(gca, 'box', 'off')

[c_test_p1 c_test_p2 c_test_p3] = test_p(x,y,L1,L2,L3,x1,x2,y2,theta,gamma);

 
% d) Teikna eina af fjórum stöðum á mynd d) í ramma 4
%----------------------------------------------------%
subplot(2,2,4) % Mynd 4 í 2x2 grid
theta = raetur(4);
[f,x,y] = f_af_theta(p1,p2,p3,L1,L2,L3,x1,x2,y2,theta,gamma);

plot_stewart (x1, x2, y2, theta, gamma, p1, p2, p3, L1, L2, L3) % Plotta Stewart mynd

axis([-2 8 -2 8])
xlabel('(d)');
pbaspect([1 1 1])
set(gca, 'box', 'off')

% Check answers by verifying strut lengths

[d_test_p1 d_test_p2 d_test_p3] = test_p(x,y,L1,L2,L3,x1,x2,y2,theta,gamma);

disp('Athugum stoðlengdir, eigum að fá p1 = p2 = 5 og p3 = 3.');
disp(' ');
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
disp('Allar lengdir stóðust!');
disp(' ');

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
   raetur5(k) = double(vpasolve(f, theta, rotabil(k)));
end

%----------------------------------------------------%


%a)
%----------------------------------------------------%
theta = raetur5(1);
[f,x,y] = f_af_theta(p1,p2,p3,L1,L2,L3,x1,x2,y2,theta,gamma);

figure(6);
subplot(3,2,1)
plot_stewart (x1, x2, y2, theta, gamma, p1, p2, p3, L1, L2, L3) % Plotta Stewart mynd

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

plot_stewart (x1, x2, y2, theta, gamma, p1, p2, p3, L1, L2, L3) % Plotta Stewart mynd

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

plot_stewart (x1, x2, y2, theta, gamma, p1, p2, p3, L1, L2, L3) % Plotta Stewart mynd

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

plot_stewart (x1, x2, y2, theta, gamma, p1, p2, p3, L1, L2, L3) % Plotta Stewart mynd

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

plot_stewart (x1, x2, y2, theta, gamma, p1, p2, p3, L1, L2, L3) % Plotta Stewart mynd

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

plot_stewart (x1, x2, y2, theta, gamma, p1, p2, p3, L1, L2, L3) % Plotta Stewart mynd

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


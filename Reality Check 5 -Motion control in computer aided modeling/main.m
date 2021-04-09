% Reality check 5 in numerical analysis
clear all
figurecounter=0;
% Liður 1
disp('Liður 1');
disp('');

P_handle = @P;  % Bézier curve path P
TOL = eps; % Set tolerance
t = 0;  % Left boundary
T = 1;  % Right boundary

x_der1_handle = @x_der1;  % First x derivative of P
y_der1_handle = @y_der1;  % First y derivative of P
lengd = arc_length(x_der1_handle, y_der1_handle, t, T, TOL) % Compute arc length of P

% Liður 2
disp('');
disp('Liður 2');
disp('');

klukka = tic;  % Start timer
TOL = 0.0001;
s = 1;
t_marked = find_t_marked(s, x_der1_handle, y_der1_handle, t, T, TOL, 1)
disp("Validating t_marked (close to 0 if t_marked is correct)");
arc_length_validation = arc_length(x_der1_handle, y_der1_handle, t, t_marked, TOL)./arc_length(x_der1_handle, y_der1_handle, t, T, TOL) - s
klukka_2 = toc(klukka); % End timer
disp(strcat('Tími: ', num2str(klukka_2), 's'));

% Liður 3
disp('');
disp('Liður 3');
disp('');

klukka = tic; % Start timer
TOL3 = eps;
t_4 = [0];
n = 4;
lengdir_gef_n = 0;
for tikk = 1:n
    t_4(tikk+1) = find_t_marked(tikk/n, x_der1_handle, y_der1_handle, t, T, TOL3, 1);
    lengdir_gef_n(tikk) = arc_length(x_der1_handle, y_der1_handle,t_4(tikk),t_4(tikk+1),TOL3);
end
disp('Lengdir á milli rauðu punktanna:');
lengdir_gef_n(:)

t_20 = [0];
n = 20;
for tikk = 1:n
    t_20(tikk+1) = find_t_marked(tikk/n, x_der1_handle, y_der1_handle, t, T, TOL3, 1);
    lengdir_gef_n(tikk) = arc_length(x_der1_handle, y_der1_handle,t_20(tikk),t_20(tikk+1),TOL3);
end
disp('Lengdir á milli grænu punktanna:');
lengdir_gef_n(:)

timi = linspace(0,1,10000);

figurecounter=figurecounter+1;
figure(figurecounter);
clf;
hold on
plot(P_x(timi),P_y(timi))
plot(P_x(t_4),P_y(t_4),'*r')
plot(P_x(t_20),P_y(t_20),'*r','color','g')
plot(P_x(t_4),P_y(t_4),'*r')
text(P_x(timi(1)),P_y(timi(1))-.05,'t = 0')
hold off

klukka_3 = toc(klukka); % End timer
disp(strcat('Tími: ', num2str(klukka_3), 's'));


% Liður 4
disp('');
disp('Liður 4');
disp('');

  % Repeating liður 2
disp('Liður 2 - Newtons method');
klukka = tic; % Start timer
TOL = 0.0001;
s = 0.5;
t_marked = find_t_marked(s, x_der1_handle, y_der1_handle, t, T, TOL, 2)
disp("Validating t_marked (close to 0 if t_marked is correct)");
t = 0;
T = 1;
arc_length_validation = arc_length(x_der1_handle, y_der1_handle, t, t_marked, TOL)./arc_length(x_der1_handle, y_der1_handle, t, T, TOL) - s
klukka_4_2 = toc(klukka); % End timer

  % Repeating liður 3
disp('Liður 3 - Newtons method');
klukka = tic; % Start timer
TOL3 = eps;
t_4 = [0];
n = 4;
lengdir_gef_n = 0;
for tikk = 1:n
    t_4(tikk+1) = find_t_marked(tikk/n, x_der1_handle, y_der1_handle, t, T, TOL3, 2);
    lengdir_gef_n(tikk) = arc_length(x_der1_handle, y_der1_handle,t_4(tikk),t_4(tikk+1),TOL3);
end
disp('Lengdir á milli rauðu punktanna:');
lengdir_gef_n(:)

t_20 = [0];
n = 20;
for tikk = 1:n
    t_20(tikk+1) = find_t_marked(tikk/n, x_der1_handle, y_der1_handle, t, T, TOL3, 2);
    lengdir_gef_n(tikk) = arc_length(x_der1_handle, y_der1_handle,t_20(tikk),t_20(tikk+1),TOL3);
end
disp('Lengdir á milli grænu punktanna:');
lengdir_gef_n(:)

timi = linspace(0,1,10000);


figurecounter=figurecounter+1;
figure(figurecounter);hold on
clf;
plot(P_x(timi),P_y(timi))
plot(P_x(t_4),P_y(t_4),'*r')
plot(P_x(t_20),P_y(t_20),'*r','color','g')
plot(P_x(t_4),P_y(t_4),'*r')
text(P_x(timi(1)),P_y(timi(1))-.05,'t = 0')
hold off

klukka_4_3 = toc(klukka); % End timer
  
  % Measure computation time in this version and compare to liður 2 and 3
disp(strcat('Tími liður 2 - Newton: ', num2str(klukka_4_2), 's'));
disp(strcat('Tímasparnaður:  ', num2str(klukka_2-klukka_4_2), 's'));
disp(strcat('Tími liður 3 - Newton: ', num2str(klukka_4_3), 's'));
disp(strcat('Tímasparnaður:  ', num2str(klukka_3-klukka_4_3), 's'));


% Liður 5
disp('');
disp('Liður 5');
disp('');

h=0.01  %skrefastærð

  % Animation with default speed
P_x_handle = @(b) P_x(b);
P_y_handle = @(b) P_y(b);
figurecounter=figurecounter+1
animatecurve(P_x_handle,P_y_handle,0,s,h,figurecounter,2);
  
cla
  % Animation with constant speed
P_x_const = @(b) P_x(find_t_marked(b, x_der1_handle, y_der1_handle, 0, 1, TOL, 1))
P_y_const = @(b) P_y(find_t_marked(b, x_der1_handle, y_der1_handle, 0, 1, TOL, 1))
figurecounter=figurecounter+1
pause(0.2);
animatecurve(P_x_const,P_y_const,0,s,h,figurecounter,2);
  

 
% Liður 6
%disp('');
%disp('Liður 6');
%disp('');
% copied from Liður 1
qx_der1_handle = @qx_der1;  % First x derivative of Q
qy_der1_handle = @qy_der1;  % First y derivative of Q
% copied from Liður 2


klukka = tic;  % Start timer
TOL = 0.0001;
s = 1;
t_marked = find_t_marked(s, qx_der1_handle, qy_der1_handle, t, T, TOL, 1)
disp("Validating t_marked (close to 0 if t_marked is correct)");
arc_length_validation = arc_length(qx_der1_handle, qy_der1_handle, t, t_marked, TOL)./arc_length(qx_der1_handle, qy_der1_handle, t, T, TOL) - s
klukka_2 = toc(klukka); % End timer
disp(strcat('Tími: ', num2str(klukka_2), 's'));

% copied from Liður 3


klukka = tic; % Start timer
TOL3 = eps;
t_4 = [0];
n = 4;
lengdir_gef_n = 0;
for tikk = 1:n
    t_4(tikk+1) = find_t_marked(tikk/n, qx_der1_handle, qy_der1_handle, t, T, TOL3, 1);
    lengdir_gef_n(tikk) = arc_length(qx_der1_handle, qy_der1_handle,t_4(tikk),t_4(tikk+1),TOL3);
end
disp('Lengdir á milli rauðu punktanna:');
lengdir_gef_n(:)

t_20 = [0];
n = 20;
for tikk = 1:n
    t_20(tikk+1) = find_t_marked(tikk/n, qx_der1_handle, qy_der1_handle, t, T, TOL3, 1);
    lengdir_gef_n(tikk) = arc_length(qx_der1_handle, qy_der1_handle,t_20(tikk),t_20(tikk+1),TOL3);
end
disp('Lengdir á milli grænu punktanna:');
lengdir_gef_n(:)

timi = linspace(0,1,10000);

figurecounter=figurecounter+1;
figure(figurecounter);
clf;
hold on
plot(Q_x(timi),Q_y(timi))
plot(Q_x(t_4),Q_y(t_4),'*r')
plot(Q_x(t_20),Q_y(t_20),'*r','color','g')
plot(Q_x(t_4),Q_y(t_4),'*r')
text(Q_x(timi(1)),Q_y(timi(1))-.05,'t = 0')
hold off

klukka_3 = toc(klukka); % End timer
disp(strcat('Tími: ', num2str(klukka_3), 's'));

% copied from Liður 5


h=0.01  %skrefastærð

  % Animation with default speed
Q_x_handle = @(b) Q_x(b);
Q_y_handle = @(b) Q_y(b);
figurecounter=figurecounter+1
animatecurve(Q_x_handle,Q_y_handle,0,s,h,figurecounter,2);
  
cla
  % Animation with constant speed
Q_x_const = @(b) Q_x(find_t_marked(b, qx_der1_handle, qy_der1_handle, 0, 1, TOL, 1))
Q_y_const = @(b) Q_y(find_t_marked(b, qx_der1_handle, qy_der1_handle, 0, 1, TOL, 1))
figurecounter=figurecounter+1
pause(0.2);
animatecurve(Q_x_const,Q_y_const,0,s,h,figurecounter,2);


%Liður 7
disp('');
disp('Liður 7');
disp('');
h=0.01  %skrefastærð
%%animatecurve(xf,yf,a,b,h,k)


%TEIKNAR C(s)=s^(1/3)
figurecounter=figurecounter+1;
x_7l1=@(b) b;
y_7l1=@(b) b.^(1/3);
animatecurve(x_7l1,y_7l1,0,1,h,figurecounter,1)

%TEIKNAR C(s)=s^2
figurecounter=figurecounter+1;
x_7l2=@(b) b;
y_7l2=@(b) b.^(2);
animatecurve(x_7l2,y_7l2,0,1,h,figurecounter,1)

%TEIKNAR C(s)=sin(s*pi/2)
figurecounter=figurecounter+1;
x_7l3=@(b) b;
y_7l3=@(b) sin((b.*pi)/2);
animatecurve(x_7l3,y_7l3,0,1,h,figurecounter,1)

%TEIKNAR C(s)=1/2+(1/2)*(sin((2s-1)*pi/2)
figurecounter=figurecounter+1;
x_7l4=@(b) b;
y_7l4=@(b) 1/2+(1/2)*sin(((2*b)-1)*pi/2);
animatecurve(x_7l4,y_7l4,0,1,h,figurecounter,1)

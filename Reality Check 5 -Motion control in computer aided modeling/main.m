% Reality check 5 in numerical analysis

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
s = 0.5;
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
figure(1);
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
figure(2);
clf;
hold on
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

  % Draw path in figure
figure(3);
clf;
set(gcf, 'position', [250 250 600 600]);
hold on;
plot(P_x(timi),P_y(timi));

set(gca,'XLim',[0 1],'YLim',[0 1],'Drawmode','fast', 'Visible','on');
cla
axis square
ball = line('color','r','Marker','o','MarkerSize',10, 'LineWidth',2,'erase','xor','xdata',[],'ydata',[]);

set(ball,'xdata',x,'ydata',y);
drawnow;
pause(0.01)

%figure(3)  
%set(gca,'XLim',[-2 2],'YLim',[-2 2],'Drawmode', 'fast' ,'Visible','on');
%cla
%axis square
%for t_l5=0:0.01:1
%    ball=line('color','r','Marker','o','MarkerSize',10,'LineWidth',2, 'erase','xor','xdata',x(t_l5),'ydata',y(t_l5));    
%    set(ball,'xdata',x, 'ydata',y);drawnow; pause(0.05)
%end
 
% Liður 6
%disp('');
%disp('Liður 6');
%disp('');


% Liður 7
%disp('');
%disp('Liður 7');
%disp('');
% Reality check 5 in numerical analysis

% Liður 1
P_handle = @P;  % Bézier curve path P
TOL = eps; % Set tolerance
t = 0;  % Left boundary
T = 1;  % Right boundary

x_der1_handle = @x_der1;  % First x derivative of P
y_der1_handle = @y_der1;  % First y derivative of P
lengd = arc_length(x_der1_handle, y_der1_handle, t, T, TOL) % Compute arc length of P

% Liður 2
TOL = 0.0001;
s = 0.5;
t_marked = find_t_marked(s, x_der1_handle, y_der1_handle, t, T, TOL);
disp("Validating t_marked (close to 0 if t_marked is correct)");
arc_length_validation = arc_length(x_der1_handle, y_der1_handle, t, t_marked, TOL)./arc_length(x_der1_handle, y_der1_handle, t, T, TOL) - s


% Liður 3
TOL3 = eps;
t_4 = [0];
n = 4;
for tikk = 1:n
    t_4(tikk+1) = find_t_marked(tikk/n, x_der1_handle, y_der1_handle, t, T, TOL3);
    lengdir_gef_n(tikk) = arc_length(x_der1_handle, y_der1_handle,t_4(tikk),t_4(tikk+1),TOL3);
end
lengdir_gef_n(:)

t_20 = [0];
n = 20;
for tikk = 1:n
    t_20(tikk+1) = find_t_marked(tikk/n, x_der1_handle, y_der1_handle, t, T, TOL3);
    lengdir_gef_n(tikk) = arc_length(x_der1_handle, y_der1_handle,t_20(tikk),t_20(tikk+1),TOL3);
end
lengdir_gef_n(:)

timi = linspace(0,1,10000);
hold on
plot(x(timi),y(timi))
plot(x(t_4),y(t_4),'*r')
plot(x(t_20),y(t_20),'*r','color','g')
plot(x(t_4),y(t_4),'*r')
text(x(timi(1)),y(timi(1))-.05,'t = 0')
hold off


% Liður 4


% Liður 5


% Liður 6


% Liður 7


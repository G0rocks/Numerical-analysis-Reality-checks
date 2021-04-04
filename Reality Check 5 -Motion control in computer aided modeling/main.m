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
t = 0;
T = 1;
arc_length_validation = arc_length(x_der1_handle, y_der1_handle, t, t_marked, TOL)./arc_length(x_der1_handle, y_der1_handle, t, T, TOL) - s


% Liður 3


% Liður 4


% Liður 5


% Liður 6


% Liður 7


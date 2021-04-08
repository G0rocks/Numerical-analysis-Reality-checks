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

TOL = 0.0001;
s = 0.5;
t_marked = find_t_marked(s, x_der1_handle, y_der1_handle, t, T, TOL, 1)
disp("Validating t_marked (close to 0 if t_marked is correct)");
t = 0;
T = 1;
arc_length_validation = arc_length(x_der1_handle, y_der1_handle, t, t_marked, TOL)./arc_length(x_der1_handle, y_der1_handle, t, T, TOL) - s


% Liður 3
%disp('');
%disp('Liður 3');
%disp('');


% Liður 4
disp('');
disp('Liður 4');
disp('');

  % Repeating liður 2
TOL = 0.0001;
s = 0.5;
t_marked = find_t_marked(s, x_der1_handle, y_der1_handle, t, T, TOL, 2)
disp("Validating t_marked (close to 0 if t_marked is correct)");
t = 0;
T = 1;
arc_length_validation = arc_length(x_der1_handle, y_der1_handle, t, t_marked, TOL)./arc_length(x_der1_handle, y_der1_handle, t, T, TOL) - s

  % Repeating liður 3

  
  % Measure computation time in this version and compare to liður 2 and 3


% Liður 5
%disp('');
%disp('Liður 5');
%disp('');


% Liður 6
%disp('');
%disp('Liður 6');
%disp('');


% Liður 7
%disp('');
%disp('Liður 7');
%disp('');

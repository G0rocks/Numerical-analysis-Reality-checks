% Function for computing the basic arc length for given
% First x derivative, x_der1
% First y derivative, y_der1
% Left boundary, a
% Right boundary, b

% Uses adaptive quadrature (integral function)
% Tolerance is the default tolerance

function lengd = arc_length(x_der1_local, y_der1_local, a, b)
  fun = @(t) pythagoras_C(x_der1_local(t), y_der1_local(t)); % creating function to integrate
  lengd = integral(fun, a, b);  % Integrate to find arc length
end % Function

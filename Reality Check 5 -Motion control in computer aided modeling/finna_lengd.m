% Function that uses Adaptive Quadrature to compute the arc length from% t = 0 to t = T for a given T <= 1.% arc is a function% TOL is the tolerance that the length needs to fulfill. Has to be bigger than 0function lengd = finna_lengd(arc, t, T, TOL)  % split into intervals    % Find arc length     % Check if error meets tolerance requirements    % If not, smaller intervals and try again        % If it does, awesome, lets continue  % Add length of interval to lengd  % Go to next interval  end
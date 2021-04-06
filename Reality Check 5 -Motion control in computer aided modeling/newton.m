% Function for Newtons method.
% Finds root for given function f, initial guess x0 and tolerance TOL
% If no root is found in 1.0e+6 iterations, returns the current value for the root variable

function root = newton(f, x0, TOL)
  root = x0;
  counter = 0;

  while(abs(f(root)) > TOL)
  %f(root)
    if (counter > 1.0e+6)
      return;
    end % if

    if (f(root) == 0);
      return
    end %if

    root = root - (f(root)./derivative(f, root, eps));

  end %While
end %Function

% Derivative function (Would be nice to overload this function but I don't know how)
% Calculates derivative for a given function f, value x and step size h (optional)

function output = derivative (f, x, h)
  output = (f(x+h) - f(x))./h;
end % Function

%function output = derivative (f, x)
%  output = (f(x+eps) - f(x))./eps;
%end % Function

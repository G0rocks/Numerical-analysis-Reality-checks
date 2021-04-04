% Function for the bisection method.
% Finds root for given function f, left and right boundaries a and b and tolerance TOL
% f(a).*f(b)<0 is a requirement for this function to work

function c = bisection(f, a, b, TOL)
  while(b-a)/2 > TOL
    c = (a+b)./2;
    if (f(c) == 0);
      return
    end %if
  
    if (f(a).*f(c) < 0);
      b=c;
    else
      a=c;
    end %If
  end %While  
end %Function

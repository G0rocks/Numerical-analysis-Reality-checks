% Function for computing x in the Q path

function x = Q_x(t)
  x = 0.6.*t + 1.2.*t.*t - 0.8.*t.*t.*t;
end % Function

% Function for computing the first x derivative in the Q path

function x_der1 = qx_der1(t)
  x_der1 = 0.6 + 2.4.*t - 2.4.*t.*t;
end % Function

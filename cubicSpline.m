function y_s = cubicSpline(a, b, c, d, x_i, x_j)
  x_s = x_i:0.05:x_j-0.05;
  y_s = a + b * (x_s - x_i) + c * (x_s - x_i) .^ 2 + d * (x_s - x_i) .^ 3;
endfunction

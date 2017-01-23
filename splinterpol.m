function coefficients = splinterpol(knots)
n = length(knots) - 1;
x = knots(1, :);
y = knots(2, :);
% are the knots sorted?
for i = 1:n
    if x(i + 1) < x(i)
        printf("Knots not sorted by x!");
        return;
    endif
endfor
diagonal = [];
for i = 0:n - 2
    diagonal = [diagonal 2 * (h(i, x) + h(i + 1, x))];
endfor

% A is needed to calculate c (i = 1:n-1)
A = zeros(n - 1, n - 1);
for i = 1:n - 2
    h_i = h(i, x);
    A(i, i + 1) = h_i;
    A(i + 1, i) = h_i;
endfor
% the last 2 loops could be done in one; I decided against it for readability
A = A + diag(diagonal);

r = [];
for i = 1:n - 1
    div1 = (y(i + 2) - y(i + 1)) / (h(i, x));
    div2 = (y(i + 1) - y(i)) / (h(i - 1, x));
    r = [r; 3 * (div1 - div2)];
endfor

c = A \ r;
% c_0 and c_n are 0
c = [0; c; 0];

% all a are equal to the y position of the knot
a = y(1:n)';

b = [];
for i = 0:n - 1
    div1 = (y(i + 2) - y(i + 1)) / (h(i, x));
    div2 = (2 * c(i + 1) + c(i + 2)) / (3);
    b = [b; div1 - div2 * h(i, x)];
endfor

d = [];
for i = 0:n - 1
  d = [d; (c(i + 2) - c(i+1)) / (3 * h(i, x))];
endfor

coefficients = [ a b c(1:n) d ];

endfunction

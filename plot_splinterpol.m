function plot_splinterpol (knots)
    coefficients = splinterpol(knots)
    x_s = knots(1, 1):0.05:knots(1, length(knots(1, :))) - 0.05;
    y_s = [];
    for i = 1:(length(knots) - 1)
        a = coefficients(i, 1);
        b = coefficients(i, 2);
        c = coefficients(i, 3);
        d = coefficients(i, 4);
        y_s = [y_s cubicSpline(a, b, c, d, knots(1,i), knots(1, i + 1))];
    endfor
    hold all;
    plot(x_s, y_s);
 
    % plot all knots
    for i = knots
        plot(i(1), i(2), '*');
    endfor
endfunction

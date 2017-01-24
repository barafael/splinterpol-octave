# splinterpol
Spline interpolation using octave

A spline is a curve that connects points in such a way that overall bending is minimal.
To plot a spline to given knots, use the plot_splinterpol function:

```
>> knots = [[0;0],[1;1],[3;-2],[6;4],[8;1],[9;-1],[10;0],[12;0]]; % The spline will go through those points
>> plot_splinterpol(knots);
```

A spline should be plotted, with knot points and all.

To call only the spline interpolation function:

```
>> knots = [[1;2], [2;3], [3;2], [4;1]];
>> splinterpol(knots)
ans =

   2.00000   1.53333   0.00000  -0.53333
   3.00000  -0.06667  -1.60000   0.66667
   2.00000  -1.26667   0.40000  -0.13333
>>
```
s<sub>1</sub>(x) = 2.00000 + 1.53333(x - 1) + 0.00000(x - 1)² - 0.53333(x - 1)³

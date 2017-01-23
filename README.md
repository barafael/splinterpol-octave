# splinterpol
Spline interpolation using octave

call with:

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

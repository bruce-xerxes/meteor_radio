% brucefilt_test.m
b = [ 1, 0, -1];
a= [ 1.0,   -1.779276745,    0.92439049];
x = zeros(800,1);
for j=1:800
    x(j)=100.0*sin((j/3)*6.283);
end % for j
v = zeros(800,1);
y = zeros(800,1);
% now generate difference equations
for k=4:800
    v(k)= (a(1)*x(k))-(a(2)*v(k-1))-(a(3)*v(k-2));
    y(k)= (b(1)*v(k))+(b(2)*v(k-1))+(b(3)*v(k-2));
end % for
plot(x);
grid
hold on
plot(y,'red')


function part1

X=linspace(0,3,10^3);  %This is the graph spacing.
Y=2.*(X).*cos(X.^2);   %The exact derivative
h=0.01; %The ideal h value we computed above
Z=(-sin((X-3*h).^2)+9*sin((X-2*h).^2)-45*sin((X-h).^2)+ 45*sin((X+h).^2)-9*sin((X+2*h).^2)+sin((X+3*h).^2))/(60*h);
%The above is the approximation with the correct weights and h from above.
plot(X,Y,X,Z)
title('Exact Result vs. 7-Point Centered Derivative') 
legend('Exact Derivative','7-PointDerivative')
xlabel('x')
ylabel('f prime')
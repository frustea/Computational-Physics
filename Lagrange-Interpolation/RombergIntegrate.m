function integral=RombergIntegrate(J,a,b)
%This computes integral of sin(x) over [a,b] correct to order 2J F=@(x)sin(x);

F=@(x)sin(x);
h=(b-a);
T=zeros(J,J);
for j=1:J
    S=zeros(1,j);
    for l=1:j
        S(l)=S(l)+feval(F,a+l.*(h/j));
end
Sp=sum(S);
 %The above for loop simply computes the sum in equation (16) above.
    T(j,1)=T(j,1)+(h/(2*j))*(feval(F,a)+2*Sp+feval(F,b));
    %The above expression is our Composite Trapezoid step.
for k=2:j T(j,k)=T(j,k)+T(j,k-1)+(T(j,k-1)-T(j-1,k-1))./(4^(k-1)-1);
    %This is the Richardson Extrapolation Step
end
end
integral=T(J,J);
%Like we note above T(J,J) is precisely the approximation of I to desired order.

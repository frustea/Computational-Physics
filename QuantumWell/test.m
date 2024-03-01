function test

f = @(t,v) [v(2), +1*(2/0.076)*v(1)*(-500*t^2+3500*t^4+((500*500)/(4*3500))-1)];      % BVP we are solving
[vShooting,tShooting] = RK4(f,[-0.6,0.6],[0,10^(-5)]); % solution

plot(tShooting,vShooting(:,1),'-',tShooting,vShooting(:,2),'-.')
title('Solution of Schroodnger equation for E=1 eV and and D[\psi,x]=10^-5  ')
xlabel('nm')
ylabel('\psi and D[\psi,x]')
%plot(tShooting,vShooting(:,1),'-')

end 

function Odd
%% First method: Shooting method

% Finding v'(0) = C such that v(1) = 0

C0 = 26;         % initial guess (try C0=10 for second solution)
C = fzero(@endpoint,C0);

f = @(t,v) [v(2), +1*(2/0.076)*v(1)*(-500*t^2+3500*t^4+((500*500)/(4*3500))-C^2*(0.076/2))];      % BVP we are solving- Schroodinger Equation
[vShooting,tShooting] = RK4(f,[0,0.6],[0,C]); % solution

function v1 = endpoint(C)

f = @(t,v) [v(2), +1*(2/0.076)*v(1)*(-500*t^2+3500*t^4+((500*500)/(4*3500))-C^2*(0.076/2))];
v = RK4(f,[0,0.6],[0,C]);

v1 = v(end,1); % corresponds to v(1)
v1p= v(end,2); 

end

[V1,T1] = RK4(f,[-0.6,0.6],[0,C]); % solution

plot(T1,V1(:,1),'-',T1,V1(:,2),'-.')

end

function PoincareSection(A,n)
%We fix w=2/3 and nu=1/2; input amplitude A and number of periods n.
T=2*pi/(2/3); %The period of the forcing for w=2/3.
h=T/1000; %Our step size for 1000 points per forcing period.
[B C iter]=RK4([0.2 0], n*T, 1/2, 2/3, A, h);
A1=zeros(1,n+1);
A2=zeros(1,n+1);
for i=1:n+1 A1(i)=A1(i)+B(((i-1)*1000)+1,1);
A2(i)=A2(i)+B(((i-1)*1000)+1,2); end
B1=mod(A1+pi,2*pi)-pi; %Imposes periodicity in [ pi, pi].
plot(B1(6:end),A2(6:end),'.')
%Notice that we don't plot over early entries: this is transient behavior. xlim([ pi pi]) %Imposes periodicity in plot.
xlabel('Angle \theta (Radians)')
ylabel('Velocity v (m/sec)')
ylim([-pi pi])
xlim([-pi pi])
title(' Phase Space Portrait of Pendulum (A=1.465, \nu=1/2, w=2/3)') 
end
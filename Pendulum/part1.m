
function Plotter
[A B iter]=RK4([0.2 0],100,0.5,1,1.2,1e-3); %The inputs above were just from one example.
L=mod(A(1:(iter+1),1)+pi,2*pi)-pi; %Enforces periodicity of angle \theta
plot(B,L)
ylim([-pi pi]) %Enforces periodicity of the plots
xlabel('Time (Seconds)')
ylabel('Angle \theta(t) (Radians)')
title('Figure 13: Time Evolution of Configuration of Pendulum (A=1, \nu=1/2, w=2/3)')
figure;
plot(L,A(1:(iter+1),2))
xlim([-pi pi]) %Enforces periodicity of the plots
xlabel('Angle \theta (Radians)')
ylabel('Velocity v (m/sec)')
title('Figure 10: Phase Space Portrait of Pendulum (A=1, \nu=1/2, w=2/3)')
%The above code shows the general method we use to plot; of course,
%we will slightly change the labels, titles, etc depending on the case
%at hand.
end 
function errorAny
[A1 B1 iter1]=RK4([0.2 0], 300, 1/2, 2/3, 1.2, 1e-3); %Run RK4 twice...
[A2 B2 iter2]=RK4([0.2 0], 300, 1/2, 2/3, 1.2, (1e-3)/2); %with different step size
L1=mod(A1(1:(iter1+1),1)+pi,2*pi)-pi; %Insist on periodicity 
L2p=mod(A2(1:(iter2+1),1)+pi,2*pi)-pi; %Insist on periodicity
L2 =L2p(1:2:length(L2p)); %Take only every other entry from L2p, due to half step size
J=abs(L1-L2);
plot(B1, J)
%ylim([0 0.00145])
xlabel('Time (seconds)')
ylabel('u-v (Error in RK4)')
title(' Error Analysis in RK4 Method')

end
% Function to calculate energy and magnetization for the 2D Ising model % T = Temperature, N = linear lattice size, J = Ising coupling
%k = thermalization time
% plot flag=1 if and only if you want to see plots
function [E,M,E2ave,M2ave]=ising2d(T,N,J,k,plot_flag) %% Initial configuration
grid = sign(0.5-rand(N,N)); % Random initial NxN configuration
%% Initiation
t =k*(1)*N^2;% Number of steps/ This is the number of configurations
Elist=zeros(t,1); Mlist=zeros(t,1);
Energy =  J*sum(sum(grid.*circshift(grid,[1 1])));%initial Energy
Magnet=sum(sum(grid)); %initial magnetization
trials1 = randi(N,t,1); %cheaper to generate all at once
trials2 = randi(N,t,1);
%  Metropolis algorithm
for i=1:t,
    s=trials1(i);
    u=trials2(i);
if s~=1; left1=grid(s-1,u);else left1=grid(N,u);end
if s~=N; right1=grid(s+1,u);else right1=grid(1,u);end %Periodic BCs 
if u~=1; left2=grid(s,u-1);else left2=grid(s,N);end
if u~=N; right2=grid(s,u+1);else right2=grid(s,1);end
dE=2*J* grid(s,u)*(left1+left2+right1+right2); % change in energy
p = exp(-dE/T);
% Acceptance test (including the case dE<0).
if rand <= p,
grid(s,u) = -1*grid(s,u);
Energy=Energy+dE;
Magnet=Magnet+2*grid(s,u);
end
    % Update energy and magnetization.
    Mlist(i)=Magnet;
    Elist(i)=Energy;
    %Refresh display of spin configuration every N trials.
    % if mod(i,N)==0 && plot_flag==1; bar3(grid); drawnow;
%end
end
 
       %% Display time series of energy and magnetization
Elist(Elist==0)=[];Mlist(Mlist==0)=[];
Mlist=abs(Mlist); Mlist=Mlist/N; Elist=Elist/N; 
if plot_flag==1
    figure;
    subplot(2,1,1)
    plot(Elist)
    title('Energy of system vs. time in Metroplois Algorithm, N=30')
    xlabel('Time #1');
    ylabel('Energy #1');
    subplot(2,1,2)
    plot(Mlist)
    title('Magnetization of system vs. time,in Metroplois Algorithm, N=30')
    xlabel('Time #1');
    ylabel('Magnetization #1');
end
%normalize.
                   %%  Magnetization and energy density
% Eliminate all configurations before thermalization.
Mlist(1:k)=[]; Elist(1:k)=[];
Msq=Mlist.^2;
Esq=Elist.^2;
% Average over post thermalization configurations.
M=sum(Mlist)/numel(Mlist);
E=sum(Elist)/numel(Elist);
M2ave=sum(Msq)/numel(Msq);
E2ave=sum(Esq)/numel(Esq);
end
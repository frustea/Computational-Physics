function observable2
tic
plot_flagg=1;
T=linspace(2,2.6,31);
Et=zeros(1,length(T));
Mt=zeros(1,length(T));
Cv=zeros(1,length(T));
x=zeros(1,length(T));
for i=1:20
[E,M,E2ave,M2ave]=ising2d(T(i),50,1,30*10^4,0);
Et(i)=Et(i)+E;
Mt(i)=Mt(i)+M;
Cv(i)=Cv(i) + (1/(T(i))^2)*(E2ave -(E)^2);
x(i)=x(i)+(1/(T(i)))*(M2ave-(M)^2);
end

for i=21:31
[E,M,E2ave,M2ave]=ising2d(T(i),50,1,5*10^4,0);
Et(i)=Et(i)+E;
Mt(i)=Mt(i)+M;
Cv(i)=Cv(i) + (1/(T(i))^2)*(E2ave -(E)^2);
x(i)=x(i)+(1/(T(i)))*(M2ave-(M)^2);
end



if plot_flagg==1
    figure;
    subplot(4,1,1)
    plot(T,Et)
    title('Energy of system vs. time in Metroplois Algorithm, N=50')
    xlabel('Temperature ');
    ylabel('Energy ');
    subplot(4,1,2)
    plot(T,Mt)
    title('Magnetization of system vs. time,in Metroplois Algorithm, N=50')
    xlabel('Temperature ');
    ylabel('Magnetization ');
    subplot(4,1,3)
    plot(T,Cv)
    title('Heat Capacity  of system vs. time,in Metroplois Algorithm, N=50')
    xlabel('Temperature  ');
    ylabel('Heat Capacity ');
    subplot(4,1,4)
    plot(T,x)
    title('Magnetic susceptibility  of system vs. time,in Metroplois Algorithm, N=50')
    xlabel('Temperature  ');
    ylabel('  Magnetic susceptibility');
end

toc

end

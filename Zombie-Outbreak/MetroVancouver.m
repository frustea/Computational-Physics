function MetroVancouver
tic
iter=25;
steps=100;
pvac=linspace(0,1,steps);
density=0.5;
Cost1=zeros(1,steps);
Cost2=zeros(1,steps);

for j=1:iter
for i=1:steps
    [V,nRecover]=zombie_apocalypse(density,pvac(i));

   Cost1(i)=Cost1(i)+30.*V+100.*nRecover;
   Cost2(i)=Cost2(i)+ (30.*V+100.*nRecover).*(30.*V+100.*nRecover);
end

end


CostAvg=Cost1./iter;
Cost2Avg=Cost2./iter;
Error=sqrt(Cost2Avg-CostAvg.*CostAvg)./sqrt(iter);
[alpha bbeta]=min(CostAvg); %This computes minimum cost as well as where it occurs in vector
errorbar(pvac,CostAvg,Error)
xlim([0 1])
xlabel('Fraction of Population Vaccinated')
ylabel('Total Cost of Vaccinations + Treatment ($)')
title('High Density:Dependence of Vaccinations on Cost ')



running_time = toc;
display(horzcat('Simulation for  MetroVancouver completed in ', ...
    num2str(running_time),' seconds.'));
display(horzcat('the minimum coast is  ', ...
    num2str(alpha),' where happens for ',num2str(bbeta),'  vaccination persenatage(step)'));
end

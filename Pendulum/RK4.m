% Fourth Order Runge Kutta with a constant step size
function [dynamicallist, times, iter]=RK4(initial,tfinal,nu,w,A,h)
% Definition of Parameters of the Pendulum
%nu = Damping Coefficient
%w = Frequency of Forcing
%A = Amplitude of Forcing
% Initial: vector of initial conditions.
% tfinal is the final time.
%h is the step size.
% Produces the values of the dynamical variables and the times.
% prop: function F evaluating the time derivatives.
    function [B C]=prop(K,t)
       B=K(1,2);
       C=-nu.*K(1,2)-sin(K(1,1))+A*sin(w*t); 
    end
%% Initiation
iter=round(tfinal/h);
dynamicallist=zeros(iter+1,length(initial));
dynamicallist(1,:)=initial;
for i=1:iter
    [k11 k12]=prop(dynamicallist(i,:), i*h);
    [k21 k22]=prop(dynamicallist(i,:)+(h/2).*[k11 k12],(i+1/2)*h);
    [k31 k32]=prop(dynamicallist(i,:)+(h/2).*[k21 k22], (i+1/2)*h);
    [k41 k42]=prop(dynamicallist(i,:)+h.*[k31 k32], (i+1)*h);
    dynamicallist(i+1,:)=dynamicallist(i,:)+(h/6).*([k11 k12]+2.*[k21 k22]+2.*[k31 k32]+[k41 k42]);
end
times= h*(0:iter)';
end
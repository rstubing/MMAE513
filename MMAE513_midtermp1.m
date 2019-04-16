%Richard Stubing
%MMAE 513 Midterm
%Problem 1

%initial variables
U = 30;
u = signals;
N = length(signals);
f = 80*10^3;
t = (1/f);
T = zeros(length(N));
i = 1;
j = 2;

T(1) = t;
while j <= N;
    T(j) = T(j-1) + t;
    j = j + 1;
end

%mean velocity (also sigma)
uavg = (1/N)*sum(signals');
fprintf('mean velocity')
disp(uavg)

%fluctuation
ufluc = zeros(5, length(signals));
while i <= N
    ufluc(:,i) = u(:,i) - uavg';
    i = i + 1;
end  

%variance
i = 1;
while i <=5
    uvariance(i) = (1/N)*sum(u(i,:).^2) - uavg(i)^2;
    i = i+1;
end

fprintf('variance')
disp(uvariance)

%standard deviation
urms = sqrt(uvariance);

fprintf('standard deviation')
disp(urms)

%probability density function
i=1;
while i <= 5
    pdf = (1/sqrt(2*pi*urms(i)^2))*exp(-.5.*(ufluc./urms(i)).^2);
    i = i+1;
end

%skewness
i=1;
uskewness = zeros(length(5));
while i <=5
    uskewness(i) = ((1/N)*sum(u(i,:).^3) - uavg(i)^3)/(urms(i)^3);
    i = i+1;
end

fprintf('Skewness')
disp(uskewness)

%Flatness
i=1;
uflatness = zeros(length(5));
while i <=5
    uflatness(i) = ((1/N)*sum(u(i,:).^4) - uavg(i)^4)/(urms(i)^4);
    i = i+1;
end

fprintf('Flatness')
disp(uflatness)

figure(1)
plot(u(1,:), pdf(1,:), u(2,:), pdf(2,:), u(3,:), pdf(3,:), u(4,:), pdf(4,:), u(5,:), pdf(5,:))
legend('sensor 1', 'sensor 2', 'sensor 3', 'sensor 4', 'sensor 5')
title('Probability Density Function of Velocity')
xlabel('Velocity (m/s)')
ylabel('Probability')

%raw plots
figure(2)
plot(T, u(1,:))
xlabel('time (s)')
ylabel('velocity m/s')
title('Velocity over time for sensor 1')




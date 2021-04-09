%%MATLAB Program for Generating Artificial Road Profiles as per ISO 8608:2016%%

clc;
clear all;
close all;

k = 4; 	% Geometric Mean of Degree of Roughness (for class C, k = 4)
phi0 = (4^(k-2))*1e-6; % Reference Spatial Frequency
B = 0.1;               % Sampling Interval
V = 40; % Vehicle Speed in Km/h
v = V*5/18; % Vehicle speed in m/sec
T = 120;		     % Total Time of Travel in Seconds
L = v*T;	    % Total Length of the Road Profile
N = L/B;               % Number of Steps
dn = 1/L;              % Wave Number / Frequency Band 
n  = dn : dn :N*dn;    % Spatial Frequency Band | Constitutes the Spatial Frequency of Component Sinusoids

randang = k*pi*rand(size(n));% Random Phase Angle
omega = 2*pi*n;                % Angular Frequency Band
domega = 2*pi*dn; % Difference b/w Consecutive Angular Frequencies

A = (phi0*(omega.^-2)*domega/pi).^0.5; % Amplitude of sinusoid

hx = zeros(size(n));     % Road Profile

for i=1:1:N
    x(i)=i*B;
    hx(i) = sum(A.*sin(omega.*x(i) - randang));
    
end

figure(1) % Visualization of Roads 
plot(x,hx,'r');
xlabel('Distance Travelled (m)');
ylabel('Road Amplitude(m)');
legend('Road Profile');
grid on
title ('ISO Class C Road Profile')

%%MATLAB Program for Converting Spatial Road Profile into Time Series Road Profile%%

lengthArr=size(hx, 2);
outputTime=zeros(lengthArr, 2);
outputTime(:,1)=[1:lengthArr]';
Z = hx;
Z = Z';
 
for i=2:size(hx, 2)
outputTime(i,2)=outputTime(i-1,2)+ ((x(i)-x(i-1))/v);
end

RoadProfileTS = [outputTime(:,2) Z(:,1)];

figure (2)
plot(outputTime(:,2),RoadProfileTS(:,2),'r');
xlabel('Time (sec)');
ylabel('Road Amplitude(m)');
legend('Road Profile Time Series');
grid on
title ('ISO Class C Road Profile')


%%% Visualisation of Spatial and Timeseries Road Profiles %%%

figure (3)
plot(outputTime(:,2),RoadProfileTS(:,2),'r');
hold on;
plot(x,RoadProfileTS(:,2),'b');
xlabel('Overlapped');
ylabel('Road Amplitude (m)');
grid on
title ('Visualisation of Spatial and Timeseries Road Profile')
 
%%% Road Profile to be Used in Quarter Car Model (QCM) Simulation %%%

R = [outputTime(:,2),RoadProfileTS(:,2)]; %% Use this as road input for QCM to simulate averaged continuous power output

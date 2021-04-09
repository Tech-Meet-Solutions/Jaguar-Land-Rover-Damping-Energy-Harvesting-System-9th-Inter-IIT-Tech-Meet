%% Paramters used in VIV simulink model
%rho - density of fluid
%w - natural frequency of the suspension spring damper system
%k - spring constatnt used in VIV
%c - damer coefficient used in VIV
%C_f - Coefficient of force due to vortex shedding having combined effect
%of lift and drag
%m - mass of the cylinder in the VIV system
%wn - natural frequeny of the VIV system
%tau - of the VIV system

rho=800; %kg/m^3
w=30; %rad/sec
k=245; %N/m
c= 4*pi*0.99*0.031; %N-s/m
C_f=1.5; 
m=2; %kg
wn=0.99*2*pi; %rad/sec
tau = 0.031;
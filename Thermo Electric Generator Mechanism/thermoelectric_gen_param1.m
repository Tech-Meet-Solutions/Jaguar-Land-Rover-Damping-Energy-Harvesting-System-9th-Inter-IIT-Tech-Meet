
%Not all the equations are used in the symulink model some are just for
%reference
%
%



%% From HZ-20HV datasheet
%Estimated Thermal and Electrical Characteristics
%-----------------------%Parameter Conditions:      
% Power Th=33.5°C, Tc=30°C @matched load       |     1 W
% Open Circuit Voltage Th=33.5°C, Tc=30°C      |     0.4 V
% Matched load Voltage Th=33.5°C, Tc=30°C      |     0.2 V 
% Mass                                        |     80 g

%parameters are found by using the references thermo_params and
%thermo_params2 for the matched voltage and matched power for the given
%temperature conditions


%% Temperature Conversions
%
%Kelvin (K) = Celsius (C) + 273.15
%
%Fahrenheit (F) = Celsius (C)*(1.8) + 32
%F = C*1.8 + 32

%% SIMULINK MODEL
%Th %Hot side temperature (Celsius)
Th = 33.5;
% Hot Side temperature (Kelvin)
Th = Th + 273.15;

%Tc %Cold Side Temperature (Celsius)
Tc = 30;
%Cold Side Temperature (Kelvin)
Tc = Tc + 273.15;

%delta_T %Temperature difference between the hot side and cold side
delta_T = Th - Tc;

%Vm %matched voltage
Vm = 0.2;

%Wm %Matched Power
Wm = 1;

%R %internal Resistance
%RL %Load Resistance (matched to internal resistance where R=RL)
RL = (Vm^2)/Wm; 
R = RL;

%Seebeck Coefficient
alpha = 2*Vm/delta_T;

%if RL = mR where m is the ratio between the internal and load
m = 1;

%I %Electric current
Ie = (alpha*delta_T)/((1+m)*R); 
%  = (u(1)*u(3))/((1+m)*R)

%Im %Matched Load Current
Im = (alpha*delta_T)/(2*R);
%  = (u(1)*u(3))/(2*R)


%Isc %Short Circuit Current @Vl = 0     %Isc = 2*Im=(2*Wm)/Vm;
Isc = (2*Wm)/Vm;
Isc_1 = 2*Im;

%V %Output Voltage
V = -R*(Ie-Isc);
% = -u(2)*(u(1)-(2*Wm)/Vm)








%% Physical test model study



%Vo %Open Circuit Voltage
%Vl %Load Voltage
%Rl %load resistor %look at datasheet for appropriate size in Ohms
%Vr %Voltage drop across resistor 


%I_load %current from module
%I_load = Vr/Rl

%Ri %Internal Resistance
%Ri = (Vo * Vl)/I_load

%Pmax %Maximum Power Output
%Pmax = (Vo^2)/(4*Ri)
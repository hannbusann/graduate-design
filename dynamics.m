clc
clear 
close all

% set trunk parameters, respect to hip pitch rotation shaft
trunk_com = [2    10    0];                 % com offset unit(cm)
trunk_mass = 20;                            % unit kg
trunk_inertia = 10                          % inertia respect to COM, unit kg*m^2
% set thigh parameters, respect to knee pitch rotation shaft
thigh_com = [0     30    0];                % com offset unit(cm)
thigh_mass = 6;                             % unit kg
thigh_length = 40;                          % length of thigh
thigh_inertia = 3                           % inertia respect to COM, unit kg*m^2
% set calf parameters, respect to ankle pitch rotation shaft
calf_com = [ 0    10    0];                 % com offset unit(cm)
calf_mass = 1;                              % unit kg
calf_length = 40;                           % length of calf
calf_inertia = 0.5                          % inertia respect to COM, unit kg*m^2
% set cart parameters
cart_mass = 0.5;                            % unit kg

lx=sqrt(trunk_com(1)^2+trunk_com(2)^2)

syms th1 th2 th3 th0 delx                       % four generalized coordinates
syms th1_1 th2_1 th3_1 delx_1               % first order derivative
syms T                                      % kinetic energy
T = 1/2*cart_mass*delx_1^2 + 1/2*calf_mass*((-th1_1*calf_com(2)*sin(th1))^2 +(th1_1*calf_com(2)*cos(th1)+delx_1)^2)+1/2*calf_inertia*th1_1^2+...
1/2*thigh_mass*((-th1_1*calf_length*sin(th1)-(th2_1-th1_1)*thigh_com(2)*sin(th2-th1))^2 + (delx_1+th1_1*calf_length*cos(th1)-(th2_1-th1_1)*thigh_com(2)*cos(th2-th1))^2)+1/2*thigh_inertia*(th2_1-th1_1)^2+...
1/2*trunk_mass*((-th1_1*calf_length*sin(th1)-(th2_1-th1_1)*thigh_length*sin(th2-th1)-(th2_1-th1_1-th3_1)*lx*sin(th2-th1-th3+th0))^2+(delx_1+th1_1*calf_length*cos(th1)-(th2_1-th1_1)*thigh_length*cos(th2-th1)+(th2_1-th1_1-th3_1)*lx*cos(th2-th1-th3+th0))^2)+1/2*trunk_inertia*(th2_1-th1_1-th3_1)^2


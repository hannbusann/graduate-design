clc
clear
close all


% l1 = 0.2;
% L1 = 0.4;
% l2 = 0.25;
% L2 = 0.5;
% l3 = 0.2;
% 
% m0 = 0.4;
% m1 = 0.8;
% m2 = 5;
% m3 = 10;
%  
% J1 = 0.1;
% J2 = 1;
% J3 = 10;
syms l1 L1 l2 L2 l3 m0 m1 m2 m3 J1 J2 J3 g
syms x0 th1 x1 th2
syms x0d th1d x1d th2d
syms x0dd th1dd x1dd th2dd

T0 = 1/2 * m0 * x0d^2;
T1 = 1/2 * m1 * ((x0d+l1*cos(th1)*th1d)^2 + (th1d*l1*sin(th1))^2) +1/2*J1*th1d^2;
V1 = m1*g*l1*cos(th1);


U21 = x0d +(L1+x1d+l2)*sin(th1) + (L1+x1+l2)*cos(th1)*th1d;
U22 = (L1+x1d+l2) * cos(th1) - (L1+x1+l2)*sin(th1)*th1d; 
T2 = 1/2*m2*(U21^2 + U22^2) +1/2*J2*th1d^2;
V2 = m2*g*(L1+x1+l2)*cos(th1);


U31 = x0d + (L1+x1d+L2)*sin(th1) + (L1+x1+L2)*cos(th1)*th1d+l3*cos(th1+th2)*(th1d+th2d);
U32 = (L1+x1d+L2) *cos(th1) - (L1+x1+L2)*sin(th1)*th1d-l3*sin(th1+th2)*(th1d+th2d);
T3 = 1/2 * m3 * (U31^2 + U32^2) + 1/2 * J3 * (th1d+th2d)^2;
V3 = m3*g*((L1+x1+L2)*cos(th1) + l3*cos(th1+th2));
T = T0+T1+T2+T3+ V1+V2+V3;


th1_p = simplify(diff(T,th1))
th2_p = simplify(diff(T,th2))

th1d_p = simplify(diff(T,th1d))
th2d_p = simplify(diff(T,th2d))

th1_p =(L1*m2+ L1*m3+ L2*m3+ l2*m2)*x0d+... 
(- L1*g*m2- L1*g*m3- L2*g*m3- g*l3*m3- g*l1*m1- g*l2*m2   )*th1 +...
(- g*l3*m3)*th2                                                  %% okokokokokokokokiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii

th2_p  = (-g*l3*m3)*th1 - g*l3*m3*th2 - l3*m3*(L1 + L2)*th1d - l3*m3*(L1 + L2)*th2d %% okokokokokokokokiiiiiiiiiiiiiiiiiiii
  
th1d_p =  J1*th1d + J2*th1d - 1/2*m2*(2*th1*(L1 + l2 )*(L1 + l2 ) - 2*(L1 + l2 )*(x0d + th1*(L1 + l2) + th1d*(L1 + l2 ))) + m3/2*(2*(l3 + (L1 + L2 ))*(x0d + th1*(L1 + L2 ) + th1d*(L1 + L2 ) + l3*(th1d + th2d)) + 2*(l3*(th1 + th2) + th1*(L1 + L2 ))*( - L1 -L2 ))+...
    (m1*(2*l1*(x0d + l1*th1d)))/2 + (J3*(2*th1d + 2*th2d))/2     %% okokokokokokokok after linearization
% th1d_p = collect(simplify(th1d_p),x1d)

th1d_pp = ((m2*((L1 + l2)*(2*L1 + 2*l2) - 2*(L1 + l2)^2))/2)*th1d+...
    (m1*l1^2 + J1 + J2 + J3 + (m3*(L1 + L2 + l3)*(2*L1 + 2*L2 + 2*l3))/2 + (m2*(L1 + l2)*(2*L1 + 2*l2))/2)*th1dd+...
    (-l3*m3*(L1 + L2))*th2d+...
    (J3 + (l3*m3*(2*L1 + 2*L2 + 2*l3))/2)*th2dd+...
    (l1*m1 + (m3*(2*L1 + 2*L2 + 2*l3))/2 + (m2*(2*L1 + 2*l2))/2)*x0dd                                    %% iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii这是对th2连求两次导的结果
    
th2d_p = J3*(th1d + th2d) + l3*m3*(l3*th1d + l3*th2d + x0d - L1*th2 - L2*th2  + L1*th1d + L2*th1d)%%

th2d_pp = (-l3*m3*(L1 + L2))*th2d + (J3 + l3*m3*(L1 + L2 + l3))*th1dd +(m3*l3^2 + J3)*th2dd+(l3*m3)*x0d  %% iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii这是对th1连求两次导的结果

% gap for th and x,not
x0_p = simplify(diff(T,x0))
x0_p =  0;  % iiiiiiiiiiiiiiiiiiiiiiii
x0d_p = simplify(diff(T,x0d))

x0d_p = m2/2*(2*x0d + 2*th1*(L1 + l2)+ 2*th1d*(L1 + l2 ))  + m1/2*(2*x0d+ 2*l1*th1d) + m0*x0d + m3/2*(2*x0d + 2*th1*(L1 + L2) + 2*th1d*(L1 + L2 ) + 2*l3*(th1d + th2d) )
x0d_p = collect(x0d_p,th2d)
x0d_pp = (m0 + m1 + m2 + m3)*x0dd +...
    ((m3*(2*L1 + 2*L2))/2 + (m2*(2*L1 + 2*l2))/2)*th1d+...
    (l1*m1 + (m3*(2*L1 + 2*L2 + 2*l3))/2 + (m2*(2*L1 + 2*l2))/2)*th1dd+...
    (l3*m3)*th2dd                                                              % iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii
     

x1_p = simplify(diff(T,x1))
x1_p = g*m2 + g*m3 
x1d_p = simplify(diff(T,x1d))
x1d_p = L1*m2 + L1*m3 + L2*m3 + l2*m2 + m2*x1d + m3*x1d ;
x1d_p =( m2 + m3)*x1d + L1*m2 + L1*m3 + L2*m3 + l2*m2    % iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii
% x1d_p =


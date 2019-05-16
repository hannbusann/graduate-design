clc
clear
close all

% 
l1 = 0.2;
L1 = 0.4;
l2 = 0.25;
L2 = 0.5;
l3 = 0.2;

m0 = 0.4;
m1 = 0.8;
m2 = 5;
m3 = 10;
 
J1 = 0.1;
J2 = 1;
J3 = 10;
g= 9.8
% syms l1 L1 l2 L2 l3 m0 m1 m2 m3 J1 J2 J3 g
syms x0 th1 x1 th2
syms x0d th1d x1d th2d
syms x0dd th1dd x1dd th2dd

T0 = 1/2 * m0 * x0d^2;
V0=0;
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
T = T0+T1+T2+T3-V0-V1-V2-V3;



th1_p = simplify(diff(T,th1))
th2_p = simplify(diff(T,th2))

th1d_p = simplify(diff(T,th1d))
th2d_p = simplify(diff(T,th2d))










th1_p =(L1*m2+ L1*m3+ L2*m3+ l2*m2)*x0d+... 
( L1*g*m2+ L1*g*m3+ L2*g*m3+g*l3*m3+ g*l1*m1+ g*l2*m2   )*th1 +...
(+ g*l3*m3)*th2                                                  %% okokokokokokokokiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii

th2_p  = (g*l3*m3)*th1 + g*l3*m3*th2 - l3*m3*(L1 + L2)*th1d - l3*m3*(L1 + L2)*th2d %% okokokokokokokokiiiiiiiiiiiiiiiiiiii
  
th1d_p =  J1*th1d + J2*th1d - 1/2*m2*(2*th1*(L1 + l2 )*(L1 + l2 ) - 2*(L1 + l2 )*(x0d + th1*(L1 + l2) + th1d*(L1 + l2 ))) + m3/2*(2*(l3 + (L1 + L2 ))*(x0d + th1*(L1 + L2 ) + th1d*(L1 + L2 ) + l3*(th1d + th2d)) + 2*(l3*(th1 + th2) + th1*(L1 + L2 ))*( - L1 -L2 ))+...
    (m1*(2*l1*(x0d + l1*th1d)))/2 + (J3*(2*th1d + 2*th2d))/2     %% okokokokokokokok after linearization
% th1d_p = collect(simplify(th1d_p),x1d)

th1d_pp = ((m2*((L1 + l2)*(2*L1 + 2*l2) - 2*(L1 + l2)^2))/2)*th1d+...
    (m1*l1^2 + J1 + J2 + J3 + (m3*(L1 + L2 + l3)*(2*L1 + 2*L2 + 2*l3))/2 + (m2*(L1 + l2)*(2*L1 + 2*l2))/2)*th1dd+...
    (-l3*m3*(L1 + L2))*th2d+...
    (J3 + (l3*m3*(2*L1 + 2*L2 + 2*l3))/2)*th2dd+...
    (l1*m1 + (m3*(2*L1 + 2*L2 + 2*l3))/2 + (m2*(2*L1 + 2*l2))/2)*x0dd                                    %% iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii??????th2????????????????
    
th2d_p = J3*(th1d + th2d) + l3*m3*(l3*th1d + l3*th2d + x0d - L1*th2 - L2*th2  + L1*th1d + L2*th1d)%%

th2d_pp = (-l3*m3*(L1 + L2))*th2d + (J3 + l3*m3*(L1 + L2 + l3))*th1dd +(m3*l3^2 + J3)*th2dd+(l3*m3)*x0d  %% iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii??????th1????????????????

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
x1_p = -g*m2 - g*m3 
x1d_p = simplify(diff(T,x1d))
x1d_p = L1*m2 + L1*m3 + L2*m3 + l2*m2 + m2*x1d + m3*x1d ;
x1d_pp =( m2 + m3)*x1dd   % iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii
% x1d_p =

% sort the equations ,left means the left part of the equation
x0_left = -x0_p + x0d_pp
% x0_left = vpa(x0_left,3)
th1_left = simplify(-th1_p + th1d_pp)
% th1_left = vpa(th1_left,3)
x1_left = -x1_p + x1d_pp
% x1_left = vpa(x1_left,3)
th2_left = -th2_p + th2d_pp
% th2_left = vpa(th2_left,3)

collect(th2_left,th2dd)

%place the right matrix get the A of state space representation, in the
%order of x0 th1 x1 th2
a = [ (m0 + m1 + m2 + m3), (l1*m1 + (m3*(2*L1 + 2*L2 + 2*l3))/2 + (m2*(2*L1 + 2*l2))/2),  0, (l3*m3);
    (l1*m1 + (m3*(2*L1 + 2*L2 + 2*l3))/2 + (m2*(2*L1 + 2*l2))/2),(m1*l1^2 + J1 + J2 + J3 + (m3*(L1 + L2 + l3)*(2*L1 + 2*L2 + 2*l3))/2 + (m2*(L1 + l2)*(2*L1 + 2*l2))/2),0,(J3 + (l3*m3*(2*L1 + 2*L2 + 2*l3))/2);
    0,0,(m2 + m3),0;
    0,(J3 + l3*m3*(L1 + L2 + l3)),0,(m3*l3^2 + J3)]

% n = 4
%     th2_left = th2_left - a(n,1)*x0dd - a(n,2)*th1dd - a(n,3)*x1dd - a(n,4)*th2dd
   syms F1 tao2 
    b = [-(th1d*((m3*(2*L1 + 2*L2))/2 + (m2*(2*L1 + 2*l2))/2));
        -((m2*th1d*((L1 + l2)*(2*L1 + 2*l2) - 2*(L1 + l2)^2))/2 - x0d*(L1*m2 + L1*m3 + L2*m3 + l2*m2) - th1*(L1*g*m2 + L1*g*m3 + L2*g*m3 + g*l1*m1 + g*l2*m2 + g*l3*m3) - g*l3*m3*th2 - l3*m3*th2d*(L1 + L2));
        (F1-(g*m2 + g*m3));
        (tao2-(l3*m3*x0d - g*l3*m3*th1 - g*l3*m3*th2 + l3*m3*th1d*(L1 + L2)))]
    vpa(a\b,3)

    
    
    
A=[0 1 0 0 0 0 0 0;
    0 -35.1 -300 -32 0 0 -0.135 -4.44;
    0 0 0 1 0 0 0 0;
    0 47.2 402.0 42 0 0 -0.131 5.96;
    0 0 0 0 0 1 0 0 ;
    0 0 0 0 0 0 0 0 ;
    0 0 0 0 0 0 0 1 ;
    0 -55.5 -470.0 -49.5 0 0 2.04 -6.99]
B = [0 0;
    0 2.46;
    0 0 ;
    0 -3.32;
    0 0;
    0.0667 0;
    0 0 ;
    0 3.99]
% C= [ 0 0 0.89 0 0 0 0.123 0;
%      0 0 0 0 0.926 0 0 0;
%      0 0 1 0 0 0 1 0;]
C = [1 0 0 0 0 0 0 0;
     0 1 0 0 0 0 0 0;
     0 0 1 0 0 0 0 0;
     0 0 0 1 0 0 0 0;
     0 0 0 0 1 0 0 0;
     0 0 0 0 0 1 0 0;
     0 0 0 0 0 0 1 0;
     0 0 0 0 0 0 0 1]
D = [0 0;0 0;0 0;0 0;0 0 ;0 0;0 0;0 0];
Qc= [B A*B A^2*B A^3*B A^4*B A^5*B A^6*B A^7*B]
Qo= [C; C*A; C*A^2; C*A^3;C*A^4;C*A^5;C*A^6;C*A^7]
rank(Qc)
rank(Qo)


%for discrete
sys = ss(A,B,C,D)
Ts =0.01;
sys_discrete =c2d(sys,Ts)
F = sys_discrete.A
G = sys_discrete.B
Cd =sys_discrete.C
D =[0 0;0 0;0 0;0 0;0 0;0 0;0 0;0 0]

disp(rank(ctrb(sys_discrete)));
disp(rank(obsv(sys_discrete)));

% pzmap(sys_discrete) % unstable 
% step(sys_discrete)  % 


P =  [-2.34+1.59j -2.34-1.59j -28.0 -28.1 -28.2 -28.3 -28.4 -28.5 ];
% K = acker(A,B,P)
K = place(A,B,P)
AA = A-B*K;
feedback_sys = ss(AA,B,C,D);
step(feedback_sys);

% 
% Pc= [-7.02+5j  -7.02-5j  -28  -29  -27  -28.1  -29.0  -29.1 ];    % poles of controller
% L =C\eye(3)
% A_end = A-B*K -L*C;
% B_end = L;
% C_end = -K;
% D_end = D;
% close_sys = ss(A_end, B_end, C_end,D_end);
% step(close_sys)
% 
% 



%     
% COM_X = (m3*(l3*(th1 + th2) + th1*(L1 + L2 )) + l1*m1*th1 + m2*th1*(L1 + l2 ))/(m0 + m1 + m2 + m3)
% vpa(collect(COM_X,th1),3)
% 
% COM_Z = (m3*(l3 + (L1 + L2 + x1)) + l1*m1 + m2*(L1 + l2 + x1))/(m0 + m1 + m2 + m3)
% vpa(COM_Z,3)
% 
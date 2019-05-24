clc
clear
close all

% other works have been done on paper

% syms m1 m2 m3 l2 L2 l3 J2 J3 g
m1 = 0.4;
m2 = 7.7
m3 = 25.1
l2 = 0.61
L2 = 0.88
l3 = 0.2
J2 = 0.2761
J3 = 1             %0.3108
g = 9.8


syms th1 th1d th1dd 
syms th2 th2d th2dd
syms x1 x1d 
syms x2 x2d 
syms T

x1dd = (-((L2+l3)*m3+l2*m2)*th1dd - l3*m3*th2dd)/(m1+m2+m3)
x2dd = x1dd+l2*th1dd

% haha = -th1dd*J2 - T+(m2+m3)*g*l2*th1+m3*g*(L2-l2)*th1+(m1*x1dd+m2*x2dd)*(L2-l2)+m1*x1dd*l2
% haha = simplify(haha)
% a = collect(haha,th2dd)

th1dd_xiang_haha = ((m2*(l2 - (l2*m2 + m3*(L2 + l3))/(m1 + m2 + m3)) - (m1*(l2*m2 + m3*(L2 + l3)))/(m1 + m2 + m3))*(L2 - l2) - J2 - (l2*m1*(l2*m2 + m3*(L2 + l3)))/(m1 + m2 + m3))
th2dd_xiang_haha = -(l3*m3*(L2*m1 + L2*m2 - l2*m2))/(m1 + m2 + m3)
haha_remain = T - g*l2*m2*th1 - L2*g*m3*th1



% kuku = -(th1dd+th2dd)*J3 +T +(m1*x1dd+m2*x2dd)*l3+m3*g*l3*(th1+th2)
% kuku = simplify(kuku)
% collect(kuku,th2dd)
th1dd_xiang_kuku = - J3 - (l3*m3*(L2*m1 + L2*m2 - l2*m2 + l3*m1 + l3*m2))/(m1 + m2 + m3)
th2dd_xiang_kuku = - J3 - (l3*m3*(l3*m1 + l3*m2))/(m1 + m2 + m3)
kuku_remain = - T - g*l3*m3*th1 - g*l3*m3*th2

a = [th1dd_xiang_haha , th2dd_xiang_haha ; th1dd_xiang_kuku, th2dd_xiang_kuku]
b = [haha_remain ;kuku_remain]
ST = vpa(a\b,3)

% state vector is  X = [th1 th1d th2 th2d]
A21 = diff(ST(1),th1)
A = [0 1 0 0;
     288 0  -16.9 0;
     0 0 0 1;
     -334 0  61.4 0]
 B = [0 ;-1.5 ;0;2.75]


% A = [0 1 0 0;
%      317 0  -44.8 0;
%      0 0 0 1;
%      -438 0  163 0]
%  B = [0 ;-2.29 ;0;5.6]
 C = [1 0 0 0;   % foot angle 
      0 0 1 0];  % upper trunk gesture angle
  
  D = [0 ; 0 ]
 Qc= [B A*B A^2*B A^3*B ];
 rank(Qc)        % controllable 
 Qo = [C; C*A; C*A^2; C*A^3];
 rank(Qo)        % observable 
 sys_decoupled = ss(A,B,C,D)

%  aim_poles = [ -2.34+1.59j -2.34-1.59j -40.0 -40.1]
 aim_poles = [ -3.5+2j -3.5-2j -15 -15.1]
 K = acker(A,B,aim_poles)
 AA = A - B*K;
 sys_feedback = ss(AA,B,C,D);
 step(sys_feedback)
 K
 
 now = [-0.1 0 0 0]' 
 for i = 1:100
    now_d =-B*( K* now)+ (A*now)
    now= now+ now_d*0.02;
    pp(1:4,i) = now;
    pp(5,i) = i*0.02;
 end
 plot(pp(5,:),pp(1,:));
 hold on
 plot(pp(5,:),pp(3,:));
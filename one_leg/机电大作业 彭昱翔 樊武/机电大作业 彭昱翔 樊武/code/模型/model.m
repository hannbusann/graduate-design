clc 
clear 
close all
%syms M m1 m2 l1 l2 L g J1 J2                 %????????????????????????????????,????????????????????????????
M=1.6;
l1=0.2415;
l2=0.2450;
m1=0.185;
m2=0.2;
J1=0.0036;
J2=0.0040;
g=9.81;
L=0.4830;
syms F th1 th2 th11 th21 th12 th22 x1 x      %??????F??????????????????????????????????????????????????????????????
%????????????????????????????????????????????????????????????????????P*H=Q;
H=[x;th1;th2];
P=[M+m1+m2             m1*l1+m2*L            m2*l2;
   m1*l1+m2*L    m1*l1^2+m2*L^2+J1         m2*l2*L;
   m2*l2                m2*l2*L         m2*l2^2+J2];

Q=[F;    (m1*l1+m2*L)*g*th1;   m2*g*l2*th2];

E=inv(P)*Q;
simplify(E);
G0=11.8;
%??????????????????????E????????????????
X=[x;th1;th2;x1;th11;th21];
%X1=[x1;th11;th21;x2;th12;th22];
SIMAdivision=J1*J2*M + J1*J2*m1 + J1*J2*m2 + J2*L^2*M*m2 + J2*M*l1^2*m1 + J1*M*l2^2*m2 + J2*L^2*m1*m2 + J1*l2^2*m1*m2 + J2*l1^2*m1*m2 + M*l1^2*l2^2*m1*m2 - 2*J2*L*l1*m1*m2;
SIMB4=-(- J2*m2*L^2 - m1*m2*l1^2*l2^2 - J2*m1*l1^2 - J1*m2*l2^2 - J1*J2);
SIMB5=- l1*m1*m2*l2^2 - J2*L*m2 - J2*l1*m1;
SIMB6=-l2*m2*(m1*l1^2 - L*m1*l1 + J1);
SIMA42=-(J2*g*L^2*m2^2 + g*L*l1*l2^2*m1*m2^2 + 2*J2*g*L*l1*m1*m2 + g*l1^2*l2^2*m1^2*m2 + J2*g*l1^2*m1^2);
SIMA43=-(g*m1*l1^2*l2^2*m2^2 - L*g*m1*l1*l2^2*m2^2 + J1*g*l2^2*m2^2);
SIMA52=J2*L*g*m2^2 + J2*g*l1*m1^2 + J2*L*M*g*m2 + L*g*l2^2*m1*m2^2 + J2*M*g*l1*m1 + J2*L*g*m1*m2 + g*l1*l2^2*m1^2*m2 + J2*g*l1*m1*m2 + L*M*g*l2^2*m2^2 + M*g*l1*l2^2*m1*m2;
SIMA53=g*l1*l2^2*m1*m2^2 - L*g*l2^2*m1*m2^2 - L*M*g*l2^2*m2^2;
SIMA62=-l2*m2*(L^2*M*g*m2 - g*l1^2*m1^2 + L*g*l1*m1^2 + L^2*g*m1*m2 + L*M*g*l1*m1 - L*g*l1*m1*m2);
SIMA63=l2*m2*(J1*M*g + J1*g*m1 + J1*g*m2 + L^2*M*g*m2 + M*g*l1^2*m1 + L^2*g*m1*m2 + g*l1^2*m1*m2 - 2*L*g*l1*m1*m2);



A=[     0     SIMAdivision  0          0          0          0      ;
        0         0       SIMA42       0        SIMA43       0      ;
        0         0         0    SIMAdivision     0          0      ;
        0         0       SIMA52       0        SIMA53       0      ;
        0         0         0          0          0    SIMAdivision ;
        0         0       SIMA62       0        SIMA63       0      ]/SIMAdivision;
 
 

B=[  0  ;
   SIMB4;
     0  ;
   SIMB5;
     0  ;
   SIMB6]/SIMAdivision/G0;

C=[1 0 0 0 0 0;0 0 1 0 0 0;0 0 0 0 1 0];
D=[0 0 0]';

%????????????
% A*[0;0;0;0;0;0]+B*0
% A*[23;0;0;0;0;0]+B*0
% A*[23;0;0;2;0;0]+B*0 
% A*[0;0.1;0.1;0;0;0]+B*0
x=[0;0;0;0;0;0];
u=0.1;

for i=1:100
    xx=A*x+B*u;
    x = x+xx*0.01;
    t(i)=x(1);
end
K =[582.3 929 296.7 503.2 258.4 1447.4];
I=eye(6);
N=C*(I-A-B*K)^-1*B;

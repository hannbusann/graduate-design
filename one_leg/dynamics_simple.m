clc
clear
close all


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
syms x0 th1 x1 th2
syms x0d th1d x1d th2d

T0 = 1/2 * m0 * x0d^2
T1 = 1/2 * m1 * ((x0d+l1*cos(th1)*th1d)^2 + (th1d*l1*sin(th1))^2) +1/2*J1*th1d^2

U21 = x0d +(L1+x1d+l2)*sin(th1) + (L1+x1+l2)*cos(th1)*th1d;
U22 = (L1+x1d+l2) * cos(th1) - (L1+x1+l2)*sin(th1)*th1d; 
T2 = 1/2*m2*(U21^2 + U22^2) +1/2*J2*th1d^2


U31 = x0d + (L1+x1d+L2)*sin(th1) + (L1+x1+L2)*cos(th1)*th1d+l3*cos(th1+th2)*(th1d+th2d)
U32 = (L1+x1d+L2) *cos(th1) - (L1+x1+L2)*sin(th1)*th1d-l3*sin(th1+th2)*(th1d+th2d)
T3 =
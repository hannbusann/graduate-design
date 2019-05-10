% the simplified model of the single leg robot
clc 
clear
close all

syms l1 L1 l2 L2 l3 x1 th1 th2 m0 m1 m2 m3

T1x = l1*sin(th1);
T1z = l1*cos(th1);

T2x = (L1+x1+l2)*sin(th1);
T2z = (L1+x1+l2)*cos(th1);

T3x = (L1+x1+L2)*sin(th1) + l3*sin(th1+th2);
T3z = (L1+x1+L2)*cos(th1) + l3*cos(th1+th2);

COM_X = (T1x*m1 + T2x*m2 + T3x*m3) / (m0+m1+m2+m3);
COM_Z = (T1z*m1 + T2z*m2 + T3z*m3) / (m0+m1+m2+m3);


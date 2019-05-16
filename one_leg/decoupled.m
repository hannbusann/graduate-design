clc
clear
close all

% other works have been done on paper

% syms m1 m2 m3 l2 L2 l3 J2 J3 g
m1 = 0.4;
m2 = 5
m3 = 10
l2 = 0.5
L2 = 0.8
l3 = 0.2
J2 = 3
J3 = 10
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
% collect(haha,th2dd)
th1dd_xiang_haha = ((m2*(l2 - (l2*m2 + m3*(L2 + l3))/(m1 + m2 + m3)) - (m1*(l2*m2 + m3*(L2 + l3)))/(m1 + m2 + m3))*(L2 - l2) - J2 - (l2*m1*(l2*m2 + m3*(L2 + l3)))/(m1 + m2 + m3))
th2dd_xiang_haha = -(l3*m3*(L2*m1 + L2*m2 - l2*m2))/(m1 + m2 + m3)
haha_remain = T - g*l2*m2*th1 - L2*g*m3*th1



% kuku = -(th1dd+th2dd)*J3 +T +(m1*x1dd+m2*x2dd)*l3+m3*g*l3*(th1+th2)
% kuku = simplify(kuku)
% collect(kuku,th2dd)
th1dd_xiang_kuku = - J3 - (l3*m3*(L2*m1 + L2*m2 - l2*m2 + l3*m1 + l3*m2))/(m1 + m2 + m3)
th2dd_xiang_kuku = - J3 - (l3*m3*(l3*m1 + l3*m2))/(m1 + m2 + m3)
kuku_remain = - T - g*l3*m3*th1 - g*l3*m3*th2

a = [th1dd_xiang_haha , th2dd_xiang_haha ; th1dd_xiang_kuku, th2dd_xiang_kuku];
b = [haha_remain ;kuku_remain];
a\b
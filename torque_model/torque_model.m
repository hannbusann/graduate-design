clc
clear
close all
param = 3:1:26
torque = [1, 1.4, 1.9 , 2.3 , 2.7 , 3.1 , 3.4 , 3.7 , 4.5 , 5.6 , 5.8 , 6.3 , 6.5 ,6.9 , 7.3 , 7.8 , 8 , 8.3 , 8.8 , 9.3 , 9.7 , 10.1 , 10.5 , 11]
torque = torque*0.075
plot(param,torque)
cftool
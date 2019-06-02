clc
clear
close all

a = textread('data_torque_4.txt')
plot(a(:,7),a(:,1)*57.3);
hold on
plot(a(:,7),a(:,3)*57.3);
hold on
plot(a(:,7),a(:,5));
hold on 
plot(a(:,7),a(:,6))
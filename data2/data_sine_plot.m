clc
clear
close all

a = textread('data_sine_1.txt')
plot((a(:,4)-a(1,4))/1000000000,(a(:,1)-a(1,1))*57.3);
hold on
plot((a(:,4)-a(1,4))/1000000000,a(:,3));
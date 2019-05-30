clc
close all
clear

a = textread('data1.txt')
plot(a(:,5),a(:,1))
hold on
plot(a(:,5),a(:,3))

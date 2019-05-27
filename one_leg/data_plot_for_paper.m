clc
clear
close all
a = textread('data_J3_0.3108.txt');
b = textread('data_J3_1.txt')
c = textread('data_J3_2.txt');

plot(a(5,:),a(1,:));
 hold on
 plot(a(5,:),a(3,:));
hold on  
%  subplot(1,2,2)
 plot(b(5,:),b(1,:));
 hold on
 plot(b(5,:),b(3,:));
 hold on
 
 plot(c(5,:),c(1,:));
 hold on
 plot(c(5,:),c(3,:));
 hold on
 
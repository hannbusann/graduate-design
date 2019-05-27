clc
clear
close all
a = textread('data_l3_0.2.txt');
b = textread('data_l3_0.1.txt')
c = textread('data_l3_0.5.txt');

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
 
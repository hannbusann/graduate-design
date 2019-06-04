clc
clear
close all

a = textread('data_torque_1.txt');
xx = 0:0.01:(a(135,6)-a(1,6))/1000000000;
yy = spline((a(1:135,6)-a(1,6))/1000000000,a(1:135,1),xx);
plot(xx,yy);
hold on
yy2 = spline((a(1:135,6)-a(1,6))/1000000000,a(1:135,3),xx);
plot(xx,yy2)
% plot((a(1:135,6)-a(1,6))/1000000000,a(1:135,3));

% a = textread('data_torque_4.txt')
% plot((a(1:70,7)-a(1,7))/1000000000,a(1:70,1));%*57.3);
% hold on
% plot((a(1:70,7)-a(1,7))/1000000000,a(1:70,3));%*57.3);
% hold on
% plot((a(1:70,7)-a(1,7))/1000000000,a(1:70,5));
% % hold on 
% % plot(a(1:70,7),a(1:70,6))
% 
% b= [a(1:102,1),a(1:102,3),a(1:102,5),(a(1:102,7)-a(1,7))/1000000000]
% save('torque_data.txt','b','-ascii')
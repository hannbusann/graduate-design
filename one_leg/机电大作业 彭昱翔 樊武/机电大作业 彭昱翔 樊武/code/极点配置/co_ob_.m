plant_con = ss(A,B,C,D);
T = 0.01;
plant_dis = c2d(plant_con,T,'zoh');%系统离散化
n_ctr=rank(ctrb(plant_dis.A,plant_dis.B));%能控性判断
n_obsv=rank(obsv(plant_dis.A,plant_dis.C));%能观性判断
[v d]=eig(plant_dis.A);%判断离散极点是否满足在单位圆内
AA = plant_dis.A;
BB = plant_dis.B;
CC = plant_dis.C;
DD = plant_dis.D;
clear i

pc = [-0.868+1.131*i -0.868-1.131*i -3 -5 -7 -9];%每次配置极点时调节该部分（此为连续域配置极点）
p = exp(T*pc);%将连续域配置的极点转化到离散域
K  = acker(AA,BB,p);%配置反馈矩阵K
[v d]=eig(AA-BB*K);%观察稳定性
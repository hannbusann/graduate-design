plant_con = ss(A,B,C,D);
T = 0.01;
plant_dis = c2d(plant_con,T,'zoh');%ϵͳ��ɢ��
n_ctr=rank(ctrb(plant_dis.A,plant_dis.B));%�ܿ����ж�
n_obsv=rank(obsv(plant_dis.A,plant_dis.C));%�ܹ����ж�
[v d]=eig(plant_dis.A);%�ж���ɢ�����Ƿ������ڵ�λԲ��
AA = plant_dis.A;
BB = plant_dis.B;
CC = plant_dis.C;
DD = plant_dis.D;
clear i

pc = [-0.868+1.131*i -0.868-1.131*i -3 -5 -7 -9];%ÿ�����ü���ʱ���ڸò��֣���Ϊ���������ü��㣩
p = exp(T*pc);%�����������õļ���ת������ɢ��
K  = acker(AA,BB,p);%���÷�������K
[v d]=eig(AA-BB*K);%�۲��ȶ���
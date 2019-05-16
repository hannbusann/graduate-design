function y= Kalman_Filter(u)

persistent kfX kfP kfK kfX_ kfP_  kfF kfQ kfH kfR

if u(4)==0%初始化
kfX=[0;0;0;0;0;0];%用于卡尔曼滤波的初始化
kfP=eye(6);%状态协方差矩阵，三者互不相关，故是单位矩阵
kfF=[1.0000    0.0100   -0.0001   -0.0000    0.0000    0.0000;
         0    1.0000   -0.0222   -0.0001    0.0025    0.0000;
         0         0    1.0030    0.0100   -0.0014   -0.0000;
         0         0    0.5915    1.0030   -0.2800   -0.0014;
         0         0   -0.0040   -0.0000    1.0035    0.0100;
         0         0   -0.8072   -0.0040    0.7071    1.0035];%状态转移矩阵
kfQ=0.01*eye(6);%噪声状态转移协方差矩阵
kfH=[ 1     0     0     0     0     0;
     0     0     1     0     0     0;
     0     0     0     0     1     0];%观测矩阵
kfR=0.01*eye(3);%观测噪声方差

 end

kfX_ = kfF*kfX;
kfP_ = kfF*kfP*kfF'+kfQ;
kfK = kfP_*kfH'/(kfH*kfP_*kfH'+kfR);
kfX = kfX_+kfK*([u(1);u(2);u(3)]-kfH*kfX_);
kfP = (eye(6)-kfK*kfH)*kfP_;

y = kfX;


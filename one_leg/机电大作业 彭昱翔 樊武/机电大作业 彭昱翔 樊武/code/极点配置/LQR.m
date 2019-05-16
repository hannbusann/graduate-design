%配置LQR控制器时使用
Q = diag([0.85 0 0.1 0 0.1 0]);
R = 0.00092;  
K = dlqr(AA,BB,Q,R);%配置LQR控制器的反馈增益矩阵  
[v d]=eig(AA-BB*K);%判断稳定性

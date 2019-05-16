
pop_num = 10;
ini = [0.88 0.1 0.1 0.0009];
Min = [0.5 0 0 0];
Max = [1.5 1 1 0.001];

generation = 1000;
it = 1;
pm = 0.1;%变异概率
pc = 0.9;%交叉概率
maxdata = -200;
accuracy = [10 10 10 10];
% axis=[X,Y,Z];
x_max = [2000 2000 2000 2000];
pop = generate(ini,Min,Max,pop_num,accuracy);
x = decode(pop,Min,Max,pop_num,accuracy);

%计算适应度
for iii=1:pop_num
Q = diag([x(iii,1) 0 x(iii,2) 0 x(iii,3) 0] );
R = x(iii,4);
K = dlqr(AA,BB,Q,R);  
sim('goodlar');
x11=xx.data(:,1);
x12=xx.data(:,2);
x13=xx.data(:,3);
u1=u.data;
maxx = max(x11);
maxtheta1 = max(x12);
maxtheta2 = max(x13);
maxv = max(u1);
if(maxtheta1/pi*180<10&maxtheta2/pi*180<10&maxx<1.1&maxv<26.4)
if maxx >= 1.02 
    [maxx newi] = max(x11);
    clear ii;
    for ii=newi:length(x11)
         if(x11(ii)<1.02)
             break
         end
    end
else 
    [maxx newi] = max(x11);
    clear ii;
    for ii=1:newi
         if(x11(ii)>0.98)
             break
         end
    end
end
   ts = ii/100;
else 
   ts = -0.1;
end
fitness(iii) = 100^(5/ts);
end

while it<generation
     [fit_best,index] = max(fitness);%本代中的最优目标值
    if fit_best >= maxdata
        maxdata = fit_best;
        x_max  = x(index,:);
    end
    if mod(it,10)==0
    fprintf('Generation %d complete\n',it)
    end
    [B] = seclection(fitness,pop);%轮盘赌选择
    [newpop] = crossover(pc,B);%交叉
    [B] = mutation(pm,newpop);%变异操作
    pop = B;
    x = decode(pop,Min,Max,pop_num,accuracy);
    
    it = it + 1;
   for iii=1:pop_num
Q = diag([x(iii,1) 0 x(iii,2) 0 x(iii,3) 0] );
R = x(iii,4);
K = dlqr(AA,BB,Q,R);  
sim('goodlar');
x11=xx.data(:,1);
x12=xx.data(:,2);
x13=xx.data(:,3);
u1=u.data;
maxx = max(x11);
maxtheta1 = max(x12);
maxtheta2 = max(x13);
maxv = max(u1);
if(maxtheta1/pi*180<10&maxtheta2/pi*180<10&maxx<1.1&maxv<26.4)
if maxx >= 1.02 
    [maxx newi] = max(x11);
    clear ii;
    for ii=newi:length(x11)
         if(x11(ii)<1.02)
             break
         end
    end
else 
    [maxx newi] = max(x11);
    clear ii;
    for ii=1:newi
         if(x11(ii)>0.98)
             break
         end
    end
end
   ts = ii/100;
else 
   ts = 100;
end
fitness(iii) = 100^(5/ts);
end



end
% disp(sprintf('max_f=：%.6f',num(it-1)));%输出最优解


x_max
% figure(1)   
% plot(num,'k');%绘制图形
out = x_max;

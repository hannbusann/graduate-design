function pop = generate(ini,min,max,pop_num,accuracy)
p = 0.2;%�����Ը���
%����Ⱥ��Ϊ������
n = length(ini);
now = 0;
ini_new = (ini - min)./(max - min).*(2.^accuracy);
for i= 1:n
    for j= accuracy(i):-1:1
        if(ini_new(i) < 2^(j-1))
            pop_ini(1,now+accuracy(i)-j+1) = 0;
        else
            ini_new(i) = ini_new(i) - 2^(j-1);
            pop_ini(1,now+accuracy(i)-j+1) = 1;
        end
    end
    now = now + accuracy(i);
end

%���ƴ�����Ⱥ
for i=2:pop_num
    pop_ini(i,:) = pop_ini(1,:);
end
pop = pop_ini();


%����һ�������
[M,N]=size(pop);
W = rand(M,N)<p;
    for i=2:M
        now = 0;
        for k=1:n
            for j=now+accuracy(k)-3:now+accuracy(k)
            if W(i,j) ==1
               if pop(i,j)~=1
                  pop(i,j)= 1;
               else
                  pop(i,j) = 0;
               end
            end
            end
            now = now + accuracy(k);
        end
    end
end

    
 
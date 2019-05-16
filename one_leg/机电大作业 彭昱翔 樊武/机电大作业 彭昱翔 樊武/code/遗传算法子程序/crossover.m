%½»²æ
function [newpop]=crossover(pc,A)
newpop=A;
[M,N]=size(A);
    for i= 1:2:M-1
        if rand < pc
            p = ceil(rand()*N);
            for j= p:N
                ch = A(i,j);
                newpop(i,j) = A(i+1,j);
                newpop(i+1,j) = ch;
            end
        end
    end
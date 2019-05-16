%±‰“Ï
function [newpop]=mutation(pm,A)
[M,N]=size(A);
newpop=A;
W = rand(M,N)<pm;
    for i=1:M
        for j=1:N
            if W(i,j) ==1
               if A(i,j)~=1
                  newpop(i,j)= 1;
               else
                  newpop(i,j) = 0;
               end
           end
       end
    end
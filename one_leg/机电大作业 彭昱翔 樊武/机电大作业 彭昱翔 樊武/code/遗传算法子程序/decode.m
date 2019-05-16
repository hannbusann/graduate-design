function x= decode(code,min,max,pop_num,accuracy)
[M,N] = size(code);
Sum = zeros(M,length(min));
for i=1:M
    now = 0;
    for k=1:length(min)
        for j=1:accuracy(k);
            Sum(i,k)=Sum(i,k)+code(i,now+j)*2^(accuracy(k)-j);
        end
        x(i,k) = min(k) + Sum(i,k)*(max(k)-min(k))/(2^accuracy(k) - 1);
        now = now + accuracy(k);
    end 
end

end
function output=perfect(pop,pop_num)
[M,N] = size(pop);
m = N/pop_num;
n= pop_num;
for i = 1:m
    for j=1:n
        output(i,j) = pop((i-1)*m+j);
    end
end
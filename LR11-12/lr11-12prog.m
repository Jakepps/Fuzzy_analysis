n=5;
x1=-2:1:2;
x2=-2:1:2;
y=zeros (n, n);
s=0;
Input=zeros (2,25);
Target=zeros (1, 25);
for j=1:n
    for i=1:n
    y(j, i) = (x1 (j)) ^ 2+(x2 (i)) ^ 2 + 8*(x1(j)*x2(i));
    s=s+1;
    Input (1,s) =x1 (j);
    Input (2,s) =x2 (i);
    Target (1,s) = (x1 (j)) ^ 2+(x2 (i)) ^ 2 + 8*(x1(j)*x2(i));
    end
end

s1=0;
s2=0;
  for(i=1:25)
      s1=s1+((Target(i)-output(i))^2);
      s2=s2+(Target(i)^2);
  end
s1=s1^(1/2);
d=s1/(s2^(1/2));
ans=d*100

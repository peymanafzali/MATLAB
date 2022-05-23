function [Ms,target_Shuff]=shuf(M2,target)
Ms=[M2;target];
[z,x]=size(M2);
n=1500;
for i=1:1000
    a=randi(n);
    b=randi(n);
    Temp=Ms(:,a);
    Ms(:,a)=Ms(:,b);
    Ms(:,b)=Temp;
end
target_Shuff=Ms(z+1,1:n);
Ms=Ms(1:z,1:n);
end

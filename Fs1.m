function [M1]=Fs1(Mn,target,TH1)
[m1,m2]=size(Mn);

k=1;
for i=1:m1
    if abs(corr2(Mn(i,:),target))>TH1
        MN(k,:)=Mn(i,:);
        k=k+1;
    end
end
M1=MN;
return

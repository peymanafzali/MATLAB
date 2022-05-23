function [M2]=Fs2(M1,target,TH2)
[m,n]=size(M1);

for i=1:m-3
    for j=(i+1):m-2
        if abs(corr2(M1(i,:),M1(j,:)))>TH2
            if abs(corr2(M1(i,:),target))>abs(corr2(M1(j,:),target))
                M1(j,:)=[];
              %DeleteRows := linalg::delRow(M1, j);
              m=m-1;
            else 
                M1(i,:)=[];
              %DeleteRows := linalg::delRow(M1, i);
              m=m-1;
            end
        end
    end
end
M2=M1;
return
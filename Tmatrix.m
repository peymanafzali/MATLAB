function [M,target]=Tmatrix(L,Backshift,NTS,point)
% NTS = number of training samples
% point = start point of inputs

[m1,n1]=size(L);

target=L(1,(point-NTS+1):point);

for j=1:NTS
  for i=1:Backshift
        M(i,j)=L(:,(point-NTS-i+j-1));    
  end
  
end

       
return


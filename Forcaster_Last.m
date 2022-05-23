
clear all
clc

% Please Enter Path of Data Before of Run
h='D:\Forecaster\Forecaster_Last\ANN\Data.xlsx';

% Now Run This Program

Data = importdata(h);
Data = Data.data;

Price=[];
for i=1:365
    Price=[Price Data(i,:)];
end


%[M,target]=Tmatrix(P,Backshift,NTS,point)
[M,target]=Tmatrix(Price,200,2000,4000);
TH1=0.4;
TH2=max(abs(corr(M',target')));

Mn=(M-min(min(M)))/(max(max(M))-min(min(M)));
target=(target-min(min(M)))/(max(max(M))-min(min(M)));

[M1]=Fs1(Mn,target,TH1);     % Keep Relevancy Data
[M2]=Fs2(M1,target,TH2);    % Delete Redundancy Data

[Ms,target_Shuff]=shuf(M2,target);
M2=[Ms,M2(:,1501:2000)];
target=[target_Shuff,target(:,1501:2000)];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

M_test=M2(:,1501:2000);
T_test=target(:,1501:2000);
M_train=M2(:,1:1500);
T_train=target(:,1:1500);

nntool

% NOTE: After of run, copy following lines step by step and paste in Command Window:
% 
% f=sim(network1,M_test);
% 
% figure()
% plot(T_test,'DisplayName','T_test');hold all;plot(f,'DisplayName','f');hold off;
% legend('Real data','Forecastd output')
% MSE=mean((f-T_test).^2);
% MAPE=100*mean(abs((f-T_test)/T_test));
% 
% f=f*(max(max(M))-min(min((M))))+min(min(M));
% T_test=T_test*(max(max(M))-min(min((M))))+min(min(M));
% figure()
% plot(T_test,'DisplayName','T_test');hold all;plot(f,'DisplayName','f');hold off;
% legend('Real data','Forecastd output')


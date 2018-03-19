function data=cumulativeHIST(BinCounts)
% Adriana Costa
% Ricardo Margarido
% June 2017
%
% cumulativeHIST(BinCounts)
%
%
% cumulativeHIST performes a cumulative histogram of the data in BinCounts

data=zeros(1,size(BinCounts,2));
data(1)=BinCounts(1);
for i=1:size(BinCounts,2)-1
    data(i+1)=data(i)+BinCounts(i+1);
end
end
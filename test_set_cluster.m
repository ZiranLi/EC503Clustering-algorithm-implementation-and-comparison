% x=Five_Class;
data=load('seeds_dataset.txt');
x=data(:,1:7);
% [ SetOfClusters, RD, CD, order ] = cluster_optics(x, 15, 0.01);
xtrain1 = resultQueue(1:44);
xtrain2= resultQueue(45:156);
xtrain3 = resultQueue(157:210);
xtrain_all = zeros(210,1);
% xtrain_all(:,1) = xtrain1;
% xtrain_all(:,2) = xtrain2;
% xtrain_all(:,3) = xtrain3;
for i =1:44
    xtrain_all(xtrain1(i)) = 1;
end
for i =1:112
    xtrain_all(xtrain2(i)) = 2;
end
for i =1:54
    xtrain_all(xtrain3(i)) = 3;
end
label1 = data(xtrain1,8);
label2 = data(xtrain2,8);
label3 = data(xtrain3,8);


% figure
% hold on
% plot(Five_Class(resultQueue(SetOfClusters(1).start:SetOfClusters(1).end),1),Five_Class(resultQueue(SetOfClusters(1).start:SetOfClusters(1).end),2),'r.')
% plot(Five_Class(resultQueue(SetOfClusters(2).start:SetOfClusters(2).end),1),Five_Class(resultQueue(SetOfClusters(2).start:SetOfClusters(2).end),2),'b.')
% plot(Five_Class(resultQueue(SetOfClusters(3).start:SetOfClusters(3).end),1),Five_Class(resultQueue(SetOfClusters(3).start:SetOfClusters(3).end),2),'green.')
% plot(Five_Class(resultQueue(SetOfClusters(4).start:SetOfClusters(4).end),1),Five_Class(resultQueue(SetOfClusters(4).start:SetOfClusters(4).end),2),'black.')
% plot(Five_Class(resultQueue(SetOfClusters(4).end+1:1000),1),Five_Class(resultQueue(SetOfClusters(4).end+1:1000),2),'yellow.')
% hold off
%load data as x;
%give inital MinPts as k
% data=load('data_mnist_train.mat');
data = Five_Class;
% x=data.X_train(1:60000,:);
x=data;
% x=[randn(30,2)*.4;randn(40,2)*.5+ones(40,1)*[4 4]];
[m,n]=size(x);
% for MinPts =15:20
%main function
MinPts = 15;
Core_distance=zeros(1,m);
Reachable_Distance=ones(1,m)*10^10;
% Calculate Core Distances
for i=1:m	
%     D = sort(pdist(x));
    D=sort(dist(x(i,:),x));
    Core_distance(i)=D(MinPts+1);   
end

resultQueue=[];
priorityQueue=[1:m];

index=1;
i=0;


while ~isempty(priorityQueue)
    ob=priorityQueue(index);
    resultQueue=[resultQueue ob]; 
    priorityQueue(index)=[];        
    mm=max([ones(1,length(priorityQueue))*Core_distance(ob);dist(x(ob,:),x(priorityQueue,:))]);    
    Reachable_Distance(priorityQueue(((Reachable_Distance(priorityQueue))>mm)))=mm(((Reachable_Distance(priorityQueue))>mm));
    [i1 index]=min(Reachable_Distance(priorityQueue));  
end   

Reachable_Distance(1)=max(Reachable_Distance(2:m))+.1*max(Reachable_Distance(2:m));


%     figure
%     plot(x(:,1),x(:,2),'*r');
%     title('EC503 Optics Algorithm Raw data');
%     xlabel('x coordinate')
%     ylabel('y coordinate')

figure
bar(Reachable_Distance(resultQueue));
title('EC503 Clustering Result(Optics Algorithm)');
xlabel('Ordering of the points')
ylabel('The reachability distance')

% %assign label
% store = zeros(1000,1);
% for e =0.002:0.1:0.3
%     [ SetOfClusters, RD, CD, order ] = cluster_optics(x, 15, e);
%     if size(SetOfClusters,2)==2
%         fprintf(SetOfClusters);
%     end
% end
% % aaaa(:)=x(resultQueue(SetOfClusters(1).start:SetOfClusters(1).end,8);
% aaaa(:)=x(resultQueue(),8);

function [D]=dist(i,x)
    [m,n]=size(x);
%     if n==1
%        D=abs((ones(m,1)*i-x))';
%     else
    D=(sum((((ones(m,1)*i)-x).^2)'));  
end
    
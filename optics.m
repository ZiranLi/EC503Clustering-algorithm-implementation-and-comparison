% Function: 
% [RD,CD,order]=optics(x,k)
% -------------------------------------------------------------------------
% Aim: 
% Ordering objects of a data set to obtain the clustering structure 
% -------------------------------------------------------------------------
% Input: 
% x - data set (m,n); m-objects, n-variables
% k - number of objects in a neighborhood of the selected object
% (minimal number of objects considered as a cluster)
% -------------------------------------------------------------------------
% Output: 
% RD - vector with reachability distances (m,1)
% CD - vector with core distances (m,1)
% order - vector specifying the order of objects (1,m)
% -------------------------------------------------------------------------
% Example of use:
% x=[randn(30,2)*.4;randn(40,2)*.5+ones(40,1)*[4 4]];
% [RD,CD,order]=optics(x,4)
% -------------------------------------------------------------------------
% References: 
% [1] M. Ankrest, M. Breunig, H. Kriegel, J. Sander, 
% OPTICS: Ordering Points To Identify the Clustering Structure, 
% available from www.dbs.informatik.uni-muenchen.de/cgi-bin/papers?query=--CO
% [2] M. Daszykowski, B. Walczak, D.L. Massart, Looking for natural  
% patterns in analytical data. Part 2. Tracing local density 
% with OPTICS, J. Chem. Inf. Comput. Sci. 42 (2002) 500-507
% -------------------------------------------------------------------------
% Written by Michal Daszykowski
% Department of Chemometrics, Institute of Chemistry, 
% The University of Silesia
% December 2004
% http://www.chemometria.us.edu.pl

% function [RD,CD,order,D]=optics(x,k)
% x=Five_Class;
% x=Four_Class;
x=load('seeds_dataset.txt');
x=x(:,1:7);
% x=load('x.mat');
% x=x.x;
% scatter(x(:,1),x(:,2),'filled');

% k=15;
%_________________________________
% for k=1:30
k=15;
[m,n]=size(x);  % m=70,n=2
CD=zeros(1,m);
RD=ones(1,m)*10^10;
% Calculate Core Distances
for i=1:m	
    D=sort(dist(x(i,:),x));
    CD(i)=D(k);   % 第k+1个距离是密度的界限阈值
end

order=[];
seeds=[1:m];

ind=1;

while ~isempty(seeds)
    ob=seeds(ind);
    seeds(ind)=[];      
    order=[order ob];   % 更新order
    var1 = ones(1,length(seeds))*CD(ob);
    var2 = dist(x(ob,:),x(seeds,:));
    mm=max([var1;var2]);    % 比较两个距离矩阵，选择较大的距离矩阵
    ii=(RD(seeds))>mm;
    RD(seeds(ii))=mm(ii);
    [~, ind]=min(RD(seeds));
end   

RD(1)=max(RD(2:m))+.1*max(RD(2:m));
figure
% subplot(6,5,k);
bar(RD(order));
str = ['MinPts=',num2str(k)];
title(str);
%     xlabel('Ordering of the points');
%     ylabel('The reachability distance')
% end
% figure
% hold on
% plot(x(order(1:861),1),x(order(1:861),2),'r.')
% plot(x(order(862:1000),1),x(order(862:1000),2),'b.')
% plot(x(order(57:110),1),x(order(57:110),2),'green.')
% plot(x(order(111:145),1),x(order(111:145),2),'black.')
% plot(x(order(146:193),1),x(order(146:193),2),'yellow.')
% plot(x(order(194:223),1),x(order(194:223),2),'m.')

function [D]=dist(i,x)
[m,n]=size(x);
D=(sum((((ones(m,1)*i)-x).^2)'));   % 距离和

if n==1
   D=abs((ones(m,1)*i-x))';
end
end

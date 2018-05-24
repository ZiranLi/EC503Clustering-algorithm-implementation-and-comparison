x=[randn(30,2)*.4;randn(40,2)*.5+ones(40,1)*[4 4]];
ind=1;
[m,n]=size(x);  % m=70,n=2
order=[];
k=4;


CD=zeros(1,m);
RD=ones(1,m)*10^10;
% Calculate Core Distances
for i=1:m	
    D=sort(dist(x(i,:),x));
    CD(i)=D(k+1);   % 第k+1个距离是密度的界限阈值
end

order=[];
seeds=[1:m];

ind=1;

while ~isempty(seeds)
    ob=seeds(ind);
    seeds(ind)=[];      
    var1 = ones(1,length(seeds))*CD(ob);
    var2 = dist(x(ob,:),x(seeds,:));
    mm=max([var1;var2]); 
    ii=(RD(seeds))>mm;
    RD(seeds(ii))=mm(ii);
    [i1 ind]=min(RD(seeds));
end   

RD(1)=max(RD(2:m))+.1*max(RD(2:m));


function [D]=dist(i,x)

[m,n]=size(x);
D=(sum((((ones(m,1)*i)-x).^2)'));   

if n==1
   D=abs((ones(m,1)*i-x))';
end
end
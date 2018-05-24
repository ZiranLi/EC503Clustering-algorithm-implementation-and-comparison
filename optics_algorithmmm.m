x=load('seeds_dataset.txt');
x=x(:,1:7);
% x=Five_Class;

[m,n]=size(x);  
CD=zeros(1,m);
RD = ones(1,m)*100^100;
for MinPts = 1:30
    CD=zeros(1,m);
    RD = ones(1,m)*100^100;%initially set RD to very large value,will update in while loop
    
    %calculate core distance for all objects
    for i=1:m
        temp = sort(dist(x(i,:),x));%ascending order of distance to object i
        CD(i) = temp(MinPts);
    end
    seed=[1:m];
    order=[];
    select_who = 1;%just start from 1, acutally can be any number

    while ~isempty(seed)%stop unitl all objects are processed

        object = seed(select_who);
        order =[order object];
        seed(select_who)=[];%excile the current obj from seed list
        left_object = seed;
        how_many_left = size(left_object,2);

        %calculate the RD between obj and the remaining object
        % 1*remaining_length row vector, each element is (current, remaining)
        max_distance = max(dist(x(object,:),x(left_object,:)),ones(1,how_many_left)*CD(object));%1xhow_many_left row vector

        %update the RD of the remaining object
        for j=1:how_many_left
            element = left_object(j);
            if RD(element)>max_distance(j)
                RD(element) = max_distance(j);%update RD for low RD
            end
        end
        %find the next obj with smallest RD
        [~,select_who] = min(RD(left_object));
    end
    RD(1) = 2*max(RD(1,2:m));%define the first RD as undefinied(a large value)
    %plot the ordering Reachability distance
%     figure
    subplot(6,5,MinPts)
    bar(RD(order))
    str = ['MinPts=',num2str(MinPts)];
    title(str);
end

function [D]=dist(i,x)%D = 1xm row vector
% i is a row vector for each row in the dataset, x is the dataset
[m,n]=size(x);
if n>=2
    D=(sum((((ones(m,1)*i)-x).^2)')); %returns a 1xm row vector
end
if n==1
   D=abs((ones(m,1)*i-x))';
end
end
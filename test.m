data=[randn(30,2)*.4;randn(40,2)*.5+ones(40,1)*[4 4]];
[RD,CD,order]=optics(data,4)

figure
plot(data(:,1),data(:,2),'*r');
title('EC503 Optics Algorithm Raw data');
xlabel('x coordinate')
ylabel('y coordinate')

figure
bar(RD(order));
title('EC503 Clustering Result(Optics Algorithm)');
xlabel('Ordering of the points')
ylabel('The reachability distance')


% Brief Demo to Visualise Optics Results

% Written by Alex Kendall
% University of Cambridge
% 18 Feb 2015
% http://mi.eng.cam.ac.uk/~agk34/

% This software is licensed under GPLv3, see included glpv3.txt.

% ::IMPORTANT:: load your data to 'points'. Here is some example data:
y=load('example_data.mat');
points = y.points;
[ SetOfClusters, RD, CD, order ] = cluster_optics(points, 500, 0.02);

bar(RD(order));
figure;

% Cycle through all clusters
for i=2:length(SetOfClusters)
    bar(RD(order(SetOfClusters(i).start:SetOfClusters(i).end)));
    pause(0.5)
end
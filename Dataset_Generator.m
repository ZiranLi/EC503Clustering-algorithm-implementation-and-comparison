%
% Dataset_Generator.m
% Description: Artificially Generated Data Sets
%
% Output: Five datasets, save them to .mat file to use
%
% EC503 Learning from Data - Project
% Clustering algorithm implementation and comparison: EM, K-means and OPTICS
%

%% 2 classes
r = 10;                                 % radium
Radius_Polar = r*sqrt(rand(200,1));     % uniform random number
Angle_Polar = 2*pi*rand(200,1);         % in polar co-ordinates
x = Radius_Polar.*cos(Angle_Polar);     % convert x to rectangular coordinate
y = Radius_Polar.*sin(Angle_Polar);     % convert y to rectangular coordinate
x = [x + 20;x + 80];                    % c1 = [20, 80], c2 = [80, 20]
y = [y + 80;y + 20];     

Two_Class = horzcat(x, y);

figure(1)
plot(x, y, 'rx');                       % plot the points 
xlabel('x')
ylabel('y')
title('EC503 Artificially Generated Data Sets(2 classes) by JIA');    % title of the figure


%% 4 classes
r = 10;                                 % radium
Radius_Polar = r*sqrt(rand(200,1));     % uniform random number
Angle_Polar = 2*pi*rand(200,1);         % in polar co-ordinates
x = Radius_Polar.*cos(Angle_Polar);     % convert x to rectangular coordinate
y = Radius_Polar.*sin(Angle_Polar);     % convert y to rectangular coordinate
x = [x + 20; x + 80; x + 20; x + 80];   % c1 = [20, 80], c2 = [80, 20], c3 = [20, 20], c4 = [80, 80]
y = [y + 80; y + 20; y + 20; y + 80];

Four_Class = horzcat(x, y); 

figure(2)
plot(x, y, 'rx');                       % plot the points 
xlabel('x')
ylabel('y')
title('EC503 Artificially Generated Data Sets(4 classes) by JIA');    % title of the figure


%% 5 classes
r = 10;                                 % radium
Radius_Polar = r*sqrt(rand(200,1));     % uniform random number
Angle_Polar = 2*pi*rand(200,1);         % in polar co-ordinates
x = Radius_Polar.*cos(Angle_Polar);     % convert x to rectangular coordinate
y = Radius_Polar.*sin(Angle_Polar);     % convert y to rectangular coordinate
x = [x + 20; x + 80; x + 50; x + 20; x + 80];   % c1 = [20, 80], c2 = [80, 20], c3 = [50, 50], c4 = [20, 20], c5 = [80, 80]
y = [y + 80; y + 20; y + 50; y + 20; y + 80];

Five_Class = horzcat(x, y); 

figure(3)
plot(x, y, 'rx');                       % plot the points 
xlabel('x')
ylabel('y')
title('EC503 Artificially Generated Data Sets(5 classes) by JIA');    % title of the figure


%% 2 classes overlapped
r = 10;                                 % radium
Radius_Polar = r*sqrt(rand(500,1));     % uniform random number
Angle_Polar = 2*pi*rand(500,1);         % in polar co-ordinates
x = Radius_Polar.*cos(Angle_Polar);     % convert x to rectangular coordinate
y = Radius_Polar.*sin(Angle_Polar);     % convert y to rectangular coordinate
x = [x + 47;x + 53];                    % c1 = [20, 80], c2 = [80, 20]
y = [y + 53;y + 47];     

Two_Class_Overlap = horzcat(x, y);

figure(4)
plot(x, y, 'rx');                       % plot the points 
xlabel('x')
ylabel('y')
xlim([0 100])
ylim([0 100])
title('EC503 Artificially Generated Data Sets(2 classes overlapped) by JIA');    % title of the figure


%% 4 classes overlapped
r = 10;                                 % radium
Radius_Polar = r*sqrt(rand(500,1));     % uniform random number
Angle_Polar = 2*pi*rand(500,1);         % in polar co-ordinates
x = Radius_Polar.*cos(Angle_Polar);     % convert x to rectangular coordinate
y = Radius_Polar.*sin(Angle_Polar);     % convert y to rectangular coordinate
x = [x + 42; x + 58; x + 42; x + 58];   % c1 = [20, 80], c2 = [80, 20], c3 = [20, 20], c4 = [80, 80]
y = [y + 58; y + 42; y + 42; y + 58];

Four_Class_Overlap = horzcat(x, y);

figure(5)
plot(x, y, 'rx');                       % plot the points 
xlabel('x')
ylabel('y')
xlim([0 100])
ylim([0 100])
title('EC503 Artificially Generated Data Sets(4 classes overlapped) by JIA');    % title of the figure

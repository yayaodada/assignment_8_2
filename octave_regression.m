%% Simple regression model

%% Initialization
clear ; close all; clc
fprintf('Press enter to start.\n');
pause;

%% ======================= Part 2: Loading and cleaning Data =======================
fprintf('Loading Data ...\n')
data = load('Data.csv');
%% Noticed row 201 has Y as -10000, far from other data, suspected bad data, removed.
data(201,:) = [];

X1 = data(:,1);
X2 = data(:,2);
X1Square = X1.*X1;
X2Square = X2.*X2;
X1X2 = X1.* X2;
F = [X1, X2, X1Square, X2Square, X1X2]; 
y = data(:, 3);
m = length(y); % number of training examples

fprintf('Program paused. Press enter to continue.\n');
pause;

%% =================== Part 3: regression ===================

X = [ones(m, 1), F]; % Add a column of ones to x

% regression
theta =  (pinv(X'*X))*X'*y;
fprintf('Regression p for 1,x1,x2,x1^2,x2^2,x1*x2 is \n');
theta'
fprintf('R squared of regression is %f\n', corr(X * theta, y)^2);
fprintf('Press enter to plot.\n');
pause;

I = 1 : m;
figure;
plot(I, X * theta, "r"); % Plot the data
hold on;
plot(I, y, "b");
legend ('"predictions"', '"original"','location', 'eastoutside');
fprintf('Press enter to exit.\n');
pause;

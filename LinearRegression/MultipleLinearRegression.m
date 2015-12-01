load('OnlineNewsPopularity.mat')

% (a) Build multiple regression models to predict the popularity of online news
A1 = cat(2,ones(length(Content),1),Content);
W1 = A1\Popularity;
A2 = cat(2,ones(length(Pub_Weekdays),1),Pub_Weekdays);
W2 = A2\Popularity;
A3 = cat(2,ones(length(Stats),1),Stats);
W3 = A3\Popularity;
% (b) Use the original data points to generate the predicted popularity.
figure
subplot(1,3,1);
title('Content');
hold on;
scatter(Popularity,A1*W1,20,'filled');
subplot(1,3,2);
title('Pub Weekdays');
hold on;
scatter(Popularity,A2*W2,20,'filled');
subplot(1,3,3);
title('Stats');
hold on;
scatter(Popularity,A3*W3,20,'filled');


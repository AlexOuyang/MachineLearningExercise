load('LinearRegression.mat')

% find the coefficients for simple linear regression.
% A1 = [1,Xtrain]
A1 = cat(2,ones(length(Xtrain),1),Xtrain);
W1 = A1\Ytrain;

% find the coefficients for linear regression with quadratic term
% A2 = [1,Xtrain,Xtrain.^2]
A2 = cat(2,ones(length(Xtrain),1),Xtrain,Xtrain.^2);
W2 = A2\Ytrain;

%  find the coefficients for linear regression with cubic term,
% A3 = [1,Xtrain,Xtrain.^2,Xtrain.^3]
A3 = cat(2,ones(length(Xtrain),1),Xtrain,Xtrain.^2,Xtrain.^3);
W3 = A3\Ytrain;

% Generate predicted regression lines given the derived coefficients.
figure
subplot(1,3,1);
title('simple linear regression');
hold on
% create an X series to draw lines
Xpred = linspace(min(Xtrain),max(Xtrain),500)'; 
% predicted regression lines for simple linear regression
Ypred1 = cat(2, ones(length(Xpred),1),Xpred)*W1; 
scatter(Xtrain,Ytrain,20,'filled');
hold on;
plot(Xpred,Ypred1,'r','LineWidth',3);

subplot(1,3,2);
title('quadratic linear regression');
hold on
% predicted regression lines for linear regression with quadratic term
Ypred2 = cat(2, ones(length(Xpred),1),Xpred,Xpred.^2)*W2;
scatter(Xtrain,Ytrain,20,'filled');
hold on;
plot(Xpred,Ypred2,'r','LineWidth',3);

subplot(1,3,3);
title('cubic linear regression');
hold on
% predicted regression lines for linear regression with cubic form
Ypred3 = cat(2,ones(length(Xpred),1),Xpred,Xpred.^2,Xpred.^3)*W3;
scatter(Xtrain,Ytrain,20,'filled');
hold on;
plot(Xpred,Ypred3,'r','LineWidth',4);


% (e) Calculate training error rate.
% Error rate for simple LR
Etrain1 = mean((Ytrain - A1*W1).^2);
% Error rate for LR with quadratic term
Etrain2 = mean((Ytrain - A2*W2).^2);
% Error rate for LR with cubic form
Etrain3 = mean((Ytrain - A3*W3).^2);

% (f) Apply the coefficient to the testing set. Calculate error
A1test = cat(2,ones(length(Xtest),1),Xtest);
A2test = cat(2,ones(length(Xtest),1),Xtest,Xtest.^2);
A3test = cat(2,ones(length(Xtest),1),Xtest,Xtest.^2,Xtest.^3);

Etest1 = mean((Ytest - A1test*W1).^2);
Etest2 = mean((Ytest - A2test*W2).^2);
Etest3 = mean((Ytest - A3test*W3).^2);


load('SeparateMe.mat')

% (a) Initialize the weights for a perceptron
w1 = 2
w2 = 1
b = -3
y = b + w1*x1 + w2*x2
% (b) Draw a scatter plots of data points
scatter(x1(target==-1),x2(target==-1),10,'g','filled');
hold on
scatter(x1(target==1),x2(target==1),10,'r','filled');
x_test = -11:11; %define an arbitrary x sequence for drawing the line
y_test = (-w1*x_test-b)/w2;
plot(x_test,y_test,'k','linewidth',2);

% (c) Assign the predicted labels and determine if it is a correct classification
err_id=[];
for i = 1:size(x1) %loop through all points
    net=w1*x1(i)+w2*x2(i)+b;
    if net>=0 %set output to 1 if net >=0
        output(i) = 1;
    else %set output to -1 if net <0
        output(i) = -1;
    end
    if output(i)==target(i)
        incorrect(i) = 0;
    else
        incorrect(i) = 1;
        err_id=[err_id i]; %add index of index of incorrect output to err_id
    end
end

if any(err_id)
    scatter(x1(target==-1),x2(target==-1),10,'g','filled');
    hold on
    scatter(x1(target==1),x2(target==1),10,'r','filled');
    x_test = -11:11; %define an arbitrary x sequence for drawing the line
    y_test = (-w1*x_test-b)/w2;
    plot(x_test,y_test,'k','linewidth',2);
    scatter(x1(err_id),x2(err_id) ,50,'k','linewidth',2);
end

% (d) Update the weights for decision boundary given the error
w1=w1+(target(err_id(1))-output(err_id(1)))*x1(err_id(1));
w2=w2+(target(err_id(1))-output(err_id(1)))*x2(err_id(1));
b = b+(target(err_id(1))-output(err_id(1)));

% (e) Create a 2 by 2 subplots. recreate procedure from (c) to (d)
for index = 1:4
    err_id=[];
    for i = 1:size(x1) %loop through all points
        net=w1*x1(i)+w2*x2(i)+b;
        if net>=0 %set output to 1 if net >=0
            output(i) = 1;
        else %set output to -1 if net <0
            output(i) = -1;
        end
        if output(i)==target(i)
            incorrect(i) = 0;
        else
            incorrect(i) = 1;
            err_id=[err_id i]; %add index of index of incorrect output to err_id
        end
    end
    
    if any(err_id)
        subplot(2,2,index);
        str = sprintf('iteration %d',index);
        title(str);
        hold on
        scatter(x1(target==-1),x2(target==-1),10,'g','filled');
        hold on
        scatter(x1(target==1),x2(target==1),10,'r','filled');
        x_test = -11:11; %define an arbitrary x sequence for drawing the line
        y_test = (-w1*x_test-b)/w2;
        plot(x_test,y_test,'k','linewidth',2);
        scatter(x1(err_id),x2(err_id) ,50,'k','linewidth',2);
    end
    
    w1=w1+(target(err_id(1))-output(err_id(1)))*x1(err_id(1));
    w2=w2+(target(err_id(1))-output(err_id(1)))*x2(err_id(1));
    b = b+(target(err_id(1))-output(err_id(1)));
end


% (f) Repeat the procedure until there is no more classification error
figure
index = 0;
while true
    err_id=[];
    for i = 1:size(x1) %loop through all points
        net=w1*x1(i)+w2*x2(i)+b;
        if net>=0 %set output to 1 if net >=0
            output(i) = 1;
        else %set output to -1 if net <0
            output(i) = -1;
        end
        if output(i)==target(i)
            incorrect(i) = 0;
        else
            incorrect(i) = 1;
            err_id=[err_id i]; %add index of index of incorrect output to err_id
        end
    end
    
    % break out if no more errors
    indicator = any(err_id);
    if (sum(indicator) == 0)
        convergeInde = sprintf('iterations until converge: %d',index);
        disp(convergeInde);
        break
    end
    
    % update the weights
    w1=w1+(target(err_id(1))-output(err_id(1)))*x1(err_id(1));
    w2=w2+(target(err_id(1))-output(err_id(1)))*x2(err_id(1));
    b = b+(target(err_id(1))-output(err_id(1)));
    
    index = index+1;
end

% graph the converged plot
str = sprintf('converged');
title(str);
hold on
scatter(x1(target==-1),x2(target==-1),10,'g','filled');
hold on
scatter(x1(target==1),x2(target==1),10,'r','filled');
x_test = -11:11; %define an arbitrary x sequence for drawing the line
y_test = (-w1*x_test-b)/w2;
plot(x_test,y_test,'k','linewidth',2);
scatter(x1(err_id),x2(err_id) ,50,'k','linewidth',2);




% (a) Initialize the mean at [4,4] and set radius to be 1.5
center = [4,4];
radius = 1.5;

% (b) Plot all the points and use ?hold on?
scatter(kmeandata(:,1),kmeandata(:,2),20,'b','filled');
hold on;

for i = 1:10;
    
    % (c) plot a disk of radius 1.5 centered at the current mean using color ?green?
    plot(center(:,1) + radius*cos([0:0.01:2*pi]),center(:,2) +radius*sin([0:0.01:2*pi]),'--','Color',[0,1,0],'LineWidth',1);
    
    % (d) update the mean (cluster center) using mean-shift algorithm
    dist(:,1) = sqrt((kmeandata(:,1) - center(1,1)).^2+((kmeandata(:,2) - center(1,2)).^2));
    ind = dist <= radius;
    center = mean(kmeandata(ind,1:2));
end        
        
% (f) plot the final cluster mean after 10 iterations (step (e)) using red ?*?.
    plot(center(:,1) + radius*cos([0:0.01:2*pi]),center(:,2) +radius*sin([0:0.01:2*pi]),'*','Color',[1,0,0],'LineWidth',1);


% (a) Initialize the means (cluster centers)
centers = [0,-3;0,-1;0,1;0,4];

% (f) Create a figure of 2x2 subplots with each subplot showing result of step (d).
for i=1:4
    subplot (2,2,i)
    
    % (b) Calculate the distance between each data point to each center. 
    for j= 1:4
        dist(:,j) = sqrt((kmeandata(:,1) - centers(j,1)).^2 +(kmeandata(:,2) - centers(j,2)).^2);    
    end

    %  (c) Assign each data point with the id of its nearest cluster center.
    [v g_ind] = min(dist,[],2);
    
    
    % (d) Plot clustered data points using different colors for different clusters
    scatter(kmeandata(g_ind == 1,1),kmeandata(g_ind == 1,2),20,'r','filled');
    hold on;
    scatter(centers(1,1),centers(1,2),80,'Marker','x','MarkerEdgeColor',[0.6 0 0],'LineWidth',4);
    hold on;
    scatter(kmeandata(g_ind == 2,1),kmeandata(g_ind == 2,2),20,'g','filled');
    hold on;
    scatter(centers(2,1),centers(2,2),80,'Marker','x','MarkerEdgeColor',[0 0.6 0],'LineWidth',4);
    hold on;
    scatter(kmeandata(g_ind == 3,1),kmeandata(g_ind == 3,2),20,'y','filled');
    hold on;
    scatter(centers(3,1),centers(3,2),80,'Marker','x','MarkerEdgeColor',[0 0 0.6],'LineWidth',4);
    hold on;
    scatter(kmeandata(g_ind == 4,1),kmeandata(g_ind == 4,2),20,'black','filled');
    hold on;
    scatter(centers(4,1),centers(4,2),80,'Marker','x','MarkerEdgeColor',[0 0 0],'LineWidth',4);
    hold on;
    
    % (e) Update the means.
    centers(1,:) = mean(kmeandata(g_ind == 1,:));
    centers(2,:) = mean(kmeandata(g_ind == 2,:));
    centers(3,:) = mean(kmeandata(g_ind == 3,:));
    centers(4,:) = mean(kmeandata(g_ind == 4,:));
    title(sprintf('Iteration %d', i))
end
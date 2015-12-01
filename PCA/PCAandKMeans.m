load('Face_40by40_500.mat');
% (a) Follow the instructions in assignment #3 but use the top 3 principal components. 
MeanFace = mean(facemat,2);
Z = facemat - repmat(MeanFace, [1, size(facemat,2)]);
C = Z*Z'/size(facemat,2);
[V, D] = eig(C);
[sv, si] = sort(diag(D),'descend');
Vs = V(:,si);
Proj = (Vs(:,1:3)'*Z)';
% scatter3(Proj(1,:), Proj(2,:), Proj(3,:),20,'filled');

% (b) Implement the k-means algorithm as outlined in question 1 with k=4. Y
centers = datasample(Proj,4)

% (d) Run 10 iterations of the k-means algorithm and then plot the final result
for i=1:10
    subplot (5,2,i)
    
    for j= 1:4
        dist(:,j) = sqrt((Proj(:,1) - centers(j,1)).^2 +(Proj(:,2) - centers(j,2)).^2 +(Proj(:,3) - centers(j,3)).^2);    
    end

    [v g_ind] = min(dist,[],2);
    
    scatter3(Proj(g_ind == 1,1),Proj(g_ind == 1,2), Proj(g_ind == 1,3),20,'r','filled');
    hold on;
    scatter3(centers(1,1),centers(1,2),centers(1,3),80,'Marker','x','MarkerEdgeColor',[0.6 0 0],'LineWidth',4);
    hold on;
    scatter3(Proj(g_ind == 2,1),Proj(g_ind == 2,2),Proj(g_ind == 2,3),20,'g','filled');
    hold on;
    scatter3(centers(2,1),centers(2,2),centers(2,3),80,'Marker','x','MarkerEdgeColor',[0 0.6 0],'LineWidth',4);
    hold on;
    scatter3(Proj(g_ind == 3,1),Proj(g_ind == 3,2),Proj(g_ind == 3,3),20,'y','filled');
    hold on;
    scatter3(centers(3,1),centers(3,2),centers(3,3),80,'Marker','x','MarkerEdgeColor',[0 0 0.6],'LineWidth',4);
    hold on;
    scatter3(Proj(g_ind == 4,1),Proj(g_ind == 4,2),Proj(g_ind == 4,3),20,'black','filled');
    hold on;
    scatter3(centers(4,1),centers(4,2),centers(4,3),80,'Marker','x','MarkerEdgeColor',[0 0 0],'LineWidth',4);
    hold on;
    
    % (e) Update the means.
    centers(1,:) = mean(Proj(g_ind == 1,:));
    centers(2,:) = mean(Proj(g_ind == 2,:));
    centers(3,:) = mean(Proj(g_ind == 3,:));
    centers(4,:) = mean(Proj(g_ind == 4,:));
    title(sprintf('Iteration %d', i))
end



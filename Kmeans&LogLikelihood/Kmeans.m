load('HW5_data.mat')

K = [4,15,20,50];
figure(1);
for i = 1:length(K);
    
    % initialize all parameters
    centers = kmeandata(randi(size(kmeandata,1),K(i),1),:);
    
    for t=1:200
        %  "your code to compute the distance"
        for j=1:K(i)
            dist(:,j) = sqrt((kmeandata(:,1) - centers(j,1)).^2 +(kmeandata(:,2) - centers(j,2)).^2);
        end
        %  "your code to assign each sample to its closest cluster center"
        [v g_ind] = min(dist,[],2);
        
        %  "your code the compute the total distances"
        distSum = sum(dist);
        %  "your code to update the cluster centers"
        for j = 1:K(i)
            centers(j,:) = mean(kmeandata(g_ind==j,:));
        end
        
        %  Since I am running a large number, there's no need to detect the amount
        % of shift in cluster centers between the current iteration and the previous iteration
        
        
    end;
    subplot(2,2,i);drawnow;
    for m = 1:K(i);
        colorspec = rand(1,3);
        scatter(kmeandata(g_ind == m,1),kmeandata(g_ind == m,2),20,colorspec,'filled');
        hold on;
        
        scatter(centers(m,1),centers(m,2),80,'Marker','x','MarkerEdgeColor',[0.6 0.6 0.6],'LineWidth',4);
    end
    
    hold off;
end
clear all;
load('HW5_data.mat');

K = [1:1:50];
nlglvecTotal = zeros(length(K),10); % store 10 iterations of nlglvec
for iter = 1:10
    nlglvec = zeros(length(K),1);
    for i = 1:length(K);
        centers = kmeandata(randi(size(kmeandata,1),K(i),1),:);
        for t=1:200
            %  "your code to compute the distance"
            for j=1:K(i)
                dist(:,j) = sqrt((kmeandata(:,1) - centers(j,1)).^2 +(kmeandata(:,2) - centers(j,2)).^2);
            end
            %  "your code to assign each sample to its closest cluster center"
            [v g_ind] = min(dist,[],2);
            % v - the smallest value in each row
            % g_ind - the index of smallest value in each row
            
            %  "your code to update the cluster centers"
            for j = 1:K(i)
                centers(j,:) = mean(kmeandata(g_ind==j,:));
            end
            
            % -log(p(S|theta)), which is the sume of the total distances for
            % each centroid
            nlglvec(i) = sum(v.^2);
            

        end;
    end;
    
    nlglvecTotal(:,iter) = nlglvec;
end

nlglvecNew = mean(nlglvecTotal,2);

% plot(K, nlglvecNew);
xlabel('K');
ylabel('negative log likelihood');

subplot(1,3,1);
plot(K,exp(-nlglvec));
subplot(1,3,2);
plot(K,prior3);
subplot(1,3,3);
plot(K,exp(-nlglvec).*prior3);
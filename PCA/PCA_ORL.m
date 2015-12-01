load('ORL_32x32.mat');
faceMat = fea';
colormap gray;
% display the top 25 faces in the data set
for i = 1:25
    subplot(5,5,i);
    imagesc(reshape(faceMat(:,i),32,32));
end

% calculate the eigenfaces using pca
figure;
colormap gray;
COEFF = pca(faceMat', 'Algorithm', 'eig');
for i = 1:25
    subplot(5,5,i);
    imagesc(reshape(COEFF(:,i),32,32));
end

% calculate the mean face
figure;
colormap gray;
MeanFace = mean(faceMat,2);
imagesc(reshape(MeanFace,32,32));

% calcualte the eigenfaces from covariance matrix using eigendecomposition
figure;
colormap gray;
Z = faceMat - repmat(MeanFace, [1, size(faceMat,2)]);
C = Z*Z'/size(faceMat,2);
[V, D] = eig(C);
[sv, si] = sort(diag(D),'descend');
Vs = V(:,si);
% display the first 25 eigenfaces
for i = 1:25
    subplot(5,5,i);
    imagesc(reshape(Vs(:,i),32,32));
end

% compute the distances based on the top three principal component
% and graph a scatter plot show how those images distributed
figure;
colormap gray;
Proj = Vs(:,1:3)'*Z;
scatter3(Proj(1,:), Proj(2,:), Proj(3,:),20,'filled');

% construct the first face using the top 100 eigenfaces
figure;
colormap gray;
imagesc(reshape(Vs(:,1:100)*Vs(:,1:100)'*Z(:,1)+ MeanFace,32,32));

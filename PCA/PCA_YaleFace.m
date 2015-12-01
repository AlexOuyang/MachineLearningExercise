load('Face_40by40_500.mat')

colormap gray
for i = 1:25
    subplot(5,5,i);
    imagesc(reshape(facemat(:,i),40,40));
end

figure;
colormap gray
MeanFace = mean(facemat,2);
imagesc(reshape(MeanFace,40,40));


figure;
colormap gray;

Z = facemat - repmat(MeanFace, [1, size(facemat,2)]);
C = Z*Z'/size(facemat,2);
[V, D] = eig(C)
[sv, si] = sort(diag(D),'descend');
Vs = V(:,si);
% display the first 25 eigenfaces
for i = 1:25
    subplot(5,5,i);
    imagesc(reshape(Vs(:,i),40,40));
end

figure;
colormap gray;
Proj = Vs(:,1:3)'*Z;
scatter3(Proj(1,:), Proj(2,:), Proj(3,:),20,'filled');

figure;
colormap gray;
Reface = Vs(:,1:20)*Vs(:,1:20)'*Z(:,1)+ MeanFace;
subplot(1,5,1);
imagesc(reshape(Reface,40,40));
subplot(1,5,2);
imagesc(reshape(Vs(:,1:40)*Vs(:,1:40)'*Z(:,1)+ MeanFace,40,40));
subplot(1,5,3);
imagesc(reshape(Vs(:,1:60)*Vs(:,1:60)'*Z(:,1)+ MeanFace,40,40));
subplot(1,5,4);
imagesc(reshape(Vs(:,1:80)*Vs(:,1:80)'*Z(:,1)+ MeanFace,40,40));
subplot(1,5,5);
imagesc(reshape(Vs(:,1:100)*Vs(:,1:100)'*Z(:,1)+ MeanFace,40,40));


figure;
colormap gray
COEFF = pca(facemat', 'Algorithm', 'eig');
for i = 1:25
    subplot(5,5,i);
    imagesc(reshape(COEFF(:,i),40,40));
end

figure;
colormap gray
[U,S,V2] = svd(Z);
for i = 1:25
    subplot(5,5,i);
    imagesc(reshape(U(:,i),40,40));
end


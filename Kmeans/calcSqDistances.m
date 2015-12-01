function [ NKmatrix ] = calcSqDistances( X, Kmus )
    %assign each data vector to closest mu vector as per Bishop (9.2)
    %do this by first calculating a squared distance matrix where the n,k entry
    %contains the squared distance from the nth data vector to the kth mu vector
    
    K = size(Kmus,1);
    N = size(X,1);
    D = size(X,2);
    %Allocate a N by K matrix
    NKmatrix = zeros(N,K);
    
    % Iterate through each column in NKmatrix and input the square differences
    duplicatedCentroid = size(N,D);
    for i=1:K
        % A temp variable that holds a single duplicated centroid as a matrix
        duplicatedCentroid = repmat(Kmus(i,:),N,1);
        
        % find the squared difference between each point and the centroid
        % it is equivalent to d1 = (x1-centroidX1)^2 + (y1 - centroidY1)^2
        % till dn
        NKmatrixColumn = sum((X - duplicatedCentroid).^2, 2);
        
        % input the NKmatrixColumn into the NKmatrix
        NKmatrix(:,i) = NKmatrixColumn;
        
    end
    

function [ Rnk ] = determineRnk( sqDmat )
    %given the matrix of squared distances, determine the closest cluster
    %center for each data vector
    
    %R is the "responsibility" matrix
    %R will be an N-by-K matrix of binary values whose n,k entry is set as
    %per Bishop (9.2)
    %Specifically, the n,k entry is 1 if point n is closest to cluster k,
    %and is 0 otherwise
    

    RnkRowSize = size(sqDmat,1);
    RnkColSize = size(sqDmat,2);
    %Allocate a N by K matrix
    Rnk = zeros(RnkRowSize, RnkColSize);
    
    for i = 1:RnkRowSize
        % get the array that contains all the distances from one element to
        % all the centroids
        distancesOfOneElement = sqDmat(i,:);
        % find the smallest distances from the array
        minElement = min(distancesOfOneElement);
        % pin point the element that has the smallst distance from the
        % centroid
        minElementLocation = find(distancesOfOneElement==minElement);
        % update responsibility matrix once the closets centroid from the
        % elements are found
        Rnk(i,minElementLocation) = 1;
end


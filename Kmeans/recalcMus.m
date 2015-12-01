function [ newKmus ] = recalcMus( X, Rnk )
    %Use responsibility matrix to recalculate the mean
    
    newKmusRowNum =size(Rnk,2);
    newKmusColNum=size(X,2);
    
    %allocate space for the K mu vectors
    newKmus=zeros(newKmusRowNum,newKmusColNum);
    for i = 1:newKmusRowNum
        % find the array that indicates all the elements that belongs to
        % one cluster, then calculate the mean distances of all these
        % elements then update the new Kmus with the mean distances
        RnkCol = transpose(Rnk(:,i));
        % calculate the new Kmus columns value
        KmusCol = (RnkCol*X)/sum(RnkCol);
        newKmus(i,:) = KmusCol;
end


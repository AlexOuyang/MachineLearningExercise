   

% This is the second collection of subplots
n=1;
p=[0.25,0.75];
coinflip = mnrnd(n,p);
mnrnd(n,p);
ab = [1,1;.5,.5;50,50];
tally = [0,0];
sp_idx = [4,3,1];
plotbetapdfs(ab,sp_idx,tally);
plotWaypoints = 1;
for i = 1:2048
    % add each coin flip result to the tally
    tally = tally+coinflip;
    
    % add each coin flip result to the prior
    repCoinflip = repmat(coinflip,3,1);
    ab = ab+repCoinflip;
    
    % update the coin flip result
    coinflip = mnrnd(n,p);
    
    % print out the graph
    if i==2^plotWaypoints
        sp_idx = [4,3,plotWaypoints+1];
        plotbetapdfs(ab,sp_idx,tally);
        %update plotway point
        plotWaypoints = plotWaypoints+1;
    end
end

    
    

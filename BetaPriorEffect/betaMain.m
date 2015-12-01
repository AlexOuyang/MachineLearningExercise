% This is the first collection of subplots

%ab is a 3-by-2 matrix containing the a,b parameters for the
%priors/posteriors
%Before the first flip: ab(1,:)=[1   1];
%                       ab(2,:)=[.5 .5];
%                       ab(3,:)=[50 50];
%
%sp_idx is a 3-tuple that specfies in which subplot to plot the current
%distributions specified by the (a,b) pairs in ab.
%
%tally is a 2-tuple (# heads, # tails) containing a running count of the
%observed number of heads and tails.
%Before the first flip: tally=[0 0]
n=1;
p=[0.25,0.75];
coinflip = mnrnd(n,p);
mnrnd(n,p);
ab = [1,1;.5,.5;50,50];
tally = [0,0];
sp_idx = [3,2,1];
plotbetapdfs(ab,sp_idx,tally);
for i = 1:5
    % add each coin flip result to the tally
    tally = tally+coinflip;
    
    % add each coin flip result to the prior
    repCoinflip = repmat(coinflip,3,1);
    ab = ab+repCoinflip;
    
    % update the coin flip result
    coinflip = mnrnd(n,p);
    
    % print out the graph
    sp_idx = [3,2,i+1];
    plotbetapdfs(ab,sp_idx,tally);
end

 
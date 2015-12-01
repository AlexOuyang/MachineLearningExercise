function plotbetapdfs(ab,sp_idx,tally)
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
    %
    %
    num_rows=size(ab,1);
    xs=.001:.001:.999;
    
    subplot(sp_idx(1),sp_idx(2),sp_idx(3))
    
    mark={'-',':','--'};
    
    for row=1:num_rows
        a=ab(row,1);
        b=ab(row,2);
        marker=mark{row};
        
        vals=betapdf(xs,a,b);
        norm_vals=vals/max(vals);
        plot(xs,norm_vals,marker); hold on;
        axis([0 1 0 1.2])
        title(sprintf('%d h, %d t',tally));
        xlabel('Bias weighting for heads \mu','Interpreter','tex')
        ylabel('p(\mu|\{data\},I)','Interpreter','tex')
    end

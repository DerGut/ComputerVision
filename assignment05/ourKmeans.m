function [ labels, w] = ourKmeans(data, k, mu)

%1
t = 2;
w = zeros(1,1,3);
%2
for i=1:k
    r = rand() * uint64(length(data(1,:)));
    w(t,i,1:3) = data(1:3,r);
end

repeat = true;
clusterStore = [0;0;0];

while repeat
    for i=1:uint64(length(data(1,:)))
       %getDistances
       for j=1:k
          c_v = double(data(1:3,i));
          w_v(1,1) = double(w(t,j,1));
          w_v(2,1) = double(w(t,j,2));
          w_v(3,1) = double(w(t,j,3));
          distances(j) = norm(abs(c_v - w_v));
       end
       minimum = min(distances);
       min_k = min(find(distances==minimum));

       clusterStore(1:3,i) = min_k;
    end
    
    t = t+1;

    %update cluster centers
    for i=1:k
        %get Ck
        cluster_k = reshape(data(logical(clusterStore==i)),3,[]);
        
        %compute new wk(t)
        betrag_ck = norm(cluster_k);
        sum_cs = sum(cluster_k,2);

        w(t,i,1:3) = (1/betrag_ck) * sum_cs;
        wt =    [w(t,i,1)   ;   w(t,i,2)    ;   w(t,i,3)];
        wt1 =   [w(t-1,i,1) ;   w(t-1,i,2)  ;   w(t-1,i,3)];
        wt_wt1(i) = norm(abs(wt - wt1));


        clear cluster_k
    end

    if sum(wt_wt1>mu) > 0
       
    else
        repeat = false;
    end


end

labels = clusterStore;

end
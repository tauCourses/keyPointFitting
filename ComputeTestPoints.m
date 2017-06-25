function [pnts_gt,pnts_computed] = ComputeTestPoints(H_gt,H_computed)
index = 1;
for i = 1:100
    for j = 1:100
       pnts_gt(index,:) = H_gt * [i;j;1];
        pnts_computed(index,:) =  H_computed * [i;j;1];
        index = index + 1;
    end
end
function [pnts_gt,pnts_computed] = ComputeTestPoints(H_gt,H_computed)
for i = 1:100
    for j = 1:100
       pnts_gt(i,j) = H_gt * [i,j,1]
        pnts_computed(i,j) =  H_computed * [i,j,1]
    end
end
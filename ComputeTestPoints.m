function [pnts_gt,pnts_computed] = ComputeTestPoints(H_gt,H_computed)
index = 1;
for i = 1:100
    for j = 1:100
        pnts_gt(index,:) = [i j 1] * H_gt;
        pnts_gt(index,:) = pnts_gt(index,:)/pnts_gt(index,3);
        pnts_computed(index,:) = [i j 1] * H_computed;
        pnts_computed(index,:) = pnts_computed(index,:)/pnts_computed(index,3);
        index = index + 1;
    end
end
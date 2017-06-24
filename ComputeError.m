function [error] = ComputeError(pnts_gt,pnts_computed)
error = 0
for i = 1 : size(des1,1)
    error = error + sqrt((pnts_gt(i,1)-pnts_computed(i,1))^2 + (pnts_gt(i,2)-pnts_computed(i,2))^2 + (pnts_gt(i,3)-pnts_computed(i,3))^2)
end
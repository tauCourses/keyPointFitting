function [error] = ComputeError2(pnts_gt,pnts_computed)
    error = pnts_gt - pnts_computed;
    error = num2cell(error, 2);            %# Collect the rows into cells
    numOfLines = size(error,1);
    error = cellfun(@(x) sqrt(x(1)*x(1) + x(2)*x(2) + x(3)*x(3)) , error);
    error = sum(error);
end

function [H_ransac] = RANSAC_Wrapper(matches, fittingfn,distfn, degenfn, s, t, feedback, maxDataTrials,maxTrials)

tranAndNormalMatches = (matches)'; 

[H_ransac,inliners] = ransac(tranAndNormalMatches,fittingfn,distfn,degenfn, s, t, feedback, maxDataTrials,maxTrials);
inliners = size(inliners,2)/size(matches,1)

function [H_ransac] = RANSAC_Wrapper(matches, fittingfn,distfn, degenfn, s, t, feedback, maxDataTrials,maxTrials)

tranMatches = matches';
[h,inliners] = ransac(tranMatches,fittingfn,distfn,degenfn, s, t, feedback, maxDataTrials,maxTrials);
H_ransac = h;
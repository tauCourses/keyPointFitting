function [H_ransac] = RANSAC_Wrapper(matches, fittingfn,distfn, degenfn, s, t, feedback, maxDataTrials,maxTrials)

[T1,T2] = normlizePoints(matches);

tranAndNormalMatches(:,1:3) = T1;
tranAndNormalMatches(:,4:6) = T2;
tranAndNormalMatches = (tranAndNormalMatches)'; 

[H_ransac,inliners] = ransac(tranAndNormalMatches,fittingfn,distfn,degenfn, s, t, feedback, maxDataTrials,maxTrials);
H_ransac = (inv(T2) * H_ransac * T1)';
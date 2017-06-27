function [H_ransac] = RANSAC_Wrapper(matches, fittingfn,distfn, degenfn, s, t, feedback, maxDataTrials,maxTrials)

%[T1,T2] = normalizePoints(matches);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%normalized$$$$$$$$
T1 = matches(:,1:2) ;
T1(:,3) = 1;
T2 = matches(:,3:4);
T2(:,3) = 1;

T1translate = [1,0,0; 0,1,0; -mean(T1(:,1)), -mean(T1(:,2)),1]';
averageLengthPoints1 = mean(sqrt(sum(abs(T1).^2,2)));
T1scale = [sqrt(2)/averageLengthPoints1,0,0; 0,sqrt(2)/averageLengthPoints1,0; 0,0,1]';
T1normalize = T1scale*T1translate;
T1 = (T1normalize*T1')';


T2translate = [1,0,0; 0,1,0; -mean(T2(:,1)), -mean(T2(:,2)),1]'; 
averageLengthPoints2 = mean(sqrt(sum(abs(T2).^2,2)));
T2scale = [sqrt(2)/averageLengthPoints2,0,0; 0,sqrt(2)/averageLengthPoints2,0; 0,0,1]';
T2normalize = T2scale*T2translate;
T2 = (T2normalize*T2')';

T1normalize(:,1) = rdivide( T1normalize(:,1),T1normalize(:,3));
T1normalize(:,2) = rdivide( T1normalize(:,2),T1normalize(:,3));
T2normalize(:,1) = rdivide( T2normalize(:,1),T2normalize(:,3));
T2normalize(:,2) = rdivide( T2normalize(:,2),T2normalize(:,3));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%normalized$$$$$$$$
% need to devide by w and w', and send matches with x,y,x',y'



%T1normalize(:,1)

tranAndNormalMatches(:,1:2) = T1(:,1:2);
tranAndNormalMatches(:,3:4) = T2(:,1:2);
tranAndNormalMatches = (tranAndNormalMatches)'; 


[H_ransac,inliners] = ransac(tranAndNormalMatches,fittingfn,distfn,degenfn, s, t, feedback, maxDataTrials,maxTrials);
%T1normalize
%H_ransac
%T2normalize
%inv(T2normalize)
H_ransac = (inv(T2normalize) * H_ransac * T1normalize)';
%H_ransac


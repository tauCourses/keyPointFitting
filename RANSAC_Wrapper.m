function [H_ransac] = RANSAC_Wrapper(matches, fittingfn,distfn, degenfn, s, t, feedback, maxDataTrials,maxTrials)

%[T1,T2] = normalisePoints(matches);
%{
%%%%% Ido&Zomer down%%%%%
T1 = matches(:,1:2);
T2 = matches(:,3:4);
[T1,T1normalize] = normalisePoints(T1);
[T2,T2normalize] = normalisePoints(T2);

tranAndNormalMatches(:,1:2) = T1(:,1:2);
tranAndNormalMatches(:,3:4) = T2(:,1:2);
tranAndNormalMatches = (tranAndNormalMatches)';

%T1=T1';T2=T2';
%tranAndNormalMatches = [T1; T2];

%%%%% Ido&Zomer up %%%%%
%}

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

T2normalize
% need to devide x,y by w and x',y' by w', and for denormalization
T1normalize(:,1) = rdivide( T1normalize(:,1),T1normalize(:,3));
T1normalize(:,2) = rdivide( T1normalize(:,2),T1normalize(:,3));
T2normalize(:,1) = rdivide( T2normalize(:,1),T2normalize(:,3));
T2normalize(:,2) = rdivide( T2normalize(:,2),T2normalize(:,3));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%normalized$$$$$$$$
T2normalize



%T2normalize(3,:)

tranAndNormalMatches(:,1:2) = T1(:,1:2);
tranAndNormalMatches(:,3:4) = T2(:,1:2);
tranAndNormalMatches = (tranAndNormalMatches)'; 


[H_ransac,inliners] = ransac(tranAndNormalMatches,fittingfn,distfn,degenfn, s, t, feedback, maxDataTrials,maxTrials);

%T1normalize
%H_ransac
T2normalize
inv(T2normalize)

%{
%%%% Ido& zomer %%%%
tranAndNormalMatches = tranAndNormalMatches(:,inliners);
size(tranAndNormalMatches)
size(inliners)
H_ransac = (fittingfn(tranAndNormalMatches))';
%%% Ido & zomer %%%%
%}


H_ransac = (T2normalize \ H_ransac * T1normalize)';
%H_ransac


function [ T1, T2 ] = normlizePoints( matches )
% gets a set of points in a nx6 matrix, columns represeting x,y,w, x',y',w'
% when x,y,w is original point and x' y' w' is transformed point
% the fucntion normalize the points by translating to (0,0) and scaling to
% mean distance of sqrt(2) between.
% the function returns 2 matrixs, each one holds the normilzed points.
% T1 - original normlized points of size nx3.
% T2 - transformed normalized points of size nx3.

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




end


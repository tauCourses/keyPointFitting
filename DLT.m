function [H] = DLT(matches)
T1 = [matches(:,1:2)] ;
T1(:,3) = 1;
T2 = [matches(:,3:4)];
T2(:,3) = 1;

%T1
%T2

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

%T1
%T2

for i = 1:size(matches,1)
    start = 2*i - 1;
    A(start,1:3) = [0,0,0];  
    A(start,4:6) = [T1(i,1:3).*(-1)]; 
    A(start,7:9) = [T1(i,1:3).*T2(i,2)]; 
    A(start+1,1:3) = [T1(i,1:3)];
    A(start+1,4:6) = [0,0,0];  
    A(start+1,7:9) = [T1(i,1:3).*-(T2(i,1))];   
end

[u,s,v] = svd(A);

H(1,:) = v(1:3,end)';
H(2,:) = v(4:6,end)';
H(3,:) = v(7:9,end)';

H = (inv(T2normalize)*H*T1normalize)';



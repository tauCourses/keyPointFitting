function [inliers, M] = myDistfn(M, x, t)
 matches = x';
  T1 = [matches(:,1:2)] ;
 
 
 T1(:,3) = 1;
 T2 = [matches(:,3:4)]; 
 T2(:,3) = 1;
 index = 1;
 inliers = [];
 for i = 1:size(matches,1)
    T3(i,:) = M*(T1(i,:)');
    
   % T3(i,1) = T3(i,1)/T3(i,3);
   % T3(i,2) = T3(i,2)/T3(i,3);
    
    if(sqrt((T3(i,1)-T2(i,1))^2 + (T3(i,2)-T2(i,2))^2) < t)
        'T1'
        M
        T1(i,:)
        T2(i,:)
        T3(i,:)
        inliers(index) = i;
    end
 end

  
 
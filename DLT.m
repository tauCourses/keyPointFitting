function [H] = DLT(matches)
%M = mean(matches);
%matches = bsxfun(@minus,matches, M);
%matches(1:4,1)

c = mean(hypot(matches(:,1),matches(:,2)))
d = mean(hypot(matches(:,3),matches(:,4)))
matches(:,1:2) = matches(:,1:2) * (sqrt(2)/c)
matches(:,3:4) = matches(:,3:4) * (sqrt(2)/d)

mean(hypot(matches(:,1),matches(:,2)))
mean(hypot(matches(:,3),matches(:,4)))
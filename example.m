firstAddress = 'D:\Tel aviv university\Graphics\Assignment3\me1.pgm';
secondAddress =  'D:\Tel aviv university\Graphics\Assignment3\me2.pgm';
minGroup = 4;
inlierTrashold = 2;

H=[1 .4 0; .1 1 0; 0.5 0.3 0.9];

oriImg = imread(firstAddress);
afterImg = imread(secondAddress); %ComputeProjective(oriImg, H);
%imwrite(afterImg, secondAddress);

[num matches distVals] = match(firstAddress,secondAddress, 0.8);
DisplayCorr(firstAddress,secondAddress,matches,distVals,10)
% computedH = RANSAC_Wrapper(matches,@fittingfn,@myDistfn,@degenfn,minGroup,inlierTrashold,0,100,2000);
% 
% calcImg = ComputeProjective(oriImg, computedH);
% diffImg = appendimages(afterImg,calcImg);
% 
% %[pnts_gt,pnts_computed] = ComputeTestPoints(H,computedH);
% %error = ComputeError(pnts_gt,pnts_computed) / size(pnts_gt,1)
% 
% sizediff = size(afterImg) - size(calcImg)
% 
% imshow(diffImg);
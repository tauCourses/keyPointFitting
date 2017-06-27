firstAddress = 'D:\Tel aviv university\Graphics\Assignment3\city.pgm';
secondAddress =  'D:\Tel aviv university\Graphics\Assignment3\example.pgm';
minGroup = 4;
inlierTrashold = 0.1;
distRatio = 0.8;

H=[1 .4 0; .3 1 0; 0.4 0.3 0.8];

oriImg = imread(firstAddress);
afterImg = ComputeProjective(oriImg, H);
imwrite(afterImg, secondAddress);

[num_of_matches matches distVals] = match(firstAddress,secondAddress, distRatio);
num_of_matches
computedH = RANSAC_Wrapper(matches,@fittingfn,@myDistfn,@degenfn,minGroup,inlierTrashold,0,100,1000);

calcImg = ComputeProjective(oriImg, computedH);
diffImg = appendimages(afterImg,calcImg);

[pnts_gt,pnts_computed] = ComputeTestPoints(H,computedH);
error = ComputeError(pnts_gt,pnts_computed) / size(pnts_gt,1)

sizediff = size(afterImg) - size(calcImg)

imshow(diffImg);

firstAddress = 'D:\targil 3\left.pgm';
secondAddress =  'D:\targil 3\example.pgm';
minGroup = 4;
inlierTrashold = 0.02;

H=[1 .2 0; .1 1 0; 0.5 0.2 1];

oriImg = imread(firstAddress);
afterImg = ComputeProjective(oriImg, H);
imwrite(afterImg, secondAddress);

[num matches distVals] = match(firstAddress,secondAddress, 0.68);

computedH = RANSAC_Wrapper(matches,@fittingfn,@myDistfn,@degenfn,minGroup,inlierTrashold,0,100,1000);

calcImg = ComputeProjective(oriImg, computedH);
diffImg = appendimages(afterImg,calcImg);

[pnts_gt,pnts_computed] = ComputeTestPoints(H,computedH);
error = ComputeError(pnts_gt,pnts_computed) / size(pnts_gt,1)

sizediff = size(afterImg) - size(calcImg)

imshow(diffImg);
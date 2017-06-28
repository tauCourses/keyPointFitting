firstAddress = 'basket.pgm';
secondAddress =  'example.pgm';

minGroup = 4;
inlierTrashold = 0.1;
distRatio = 0.8;
H=[1 .2 0; .1 1 0; 0.5 0.2 1];


oriImg = imread(firstAddress);
afterImg = ComputeProjective(oriImg, H);
imwrite(afterImg, secondAddress);

[num_of_matches matches distVals] = match(firstAddress,secondAddress, distRatio);
num_of_matches
computedH_RANSAC = RANSAC_Wrapper(matches,@fittingfn,@myDistfn,@degenfn,minGroup,inlierTrashold,0,100,1000);
computedH_DLT = DLT(matches);

RANSACcalcImg = ComputeProjective(oriImg, computedH_RANSAC);
DLTcalcImg = ComputeProjective(oriImg, computedH_DLT);

diffImg1 = appendimages(DLTcalcImg,afterImg);
diffImg2 = appendimages(diffImg1,RANSACcalcImg);

[pnts_gt,pnts_computed] = ComputeTestPoints(H,computedH);
error = ComputeError(pnts_gt,pnts_computed) 
errorNormlized = error / size(pnts_gt,1)

sizediff = size(afterImg) - size(calcImg)

imshow(diffImg2);

img1Address = 'basket.pgm';
img2Address =  'mahalTransformed.pgm';

distRatio = 0.8;
H=[1 .2 0; .1 1 0; 0.5 0.2 1];

im1 = imread(firstAddress);
afterImg = ComputeProjective(oriImg, H);
imwrite(afterImg, img2Address);


[num_of_matches matches distVals] = match(img1Address,img2Address, distRatio);
num_of_matches
computedH = DLT(matches);

calcImg = ComputeProjective(oriImg, computedH);
diffImg = appendimages(afterImg,calcImg);

[pnts_gt,pnts_computed] = ComputeTestPoints(H,computedH);
error = ComputeError(pnts_gt,pnts_computed) 
errorNormlized = error / size(pnts_gt,1)

sizediff = size(afterImg) - size(calcImg)

imshow(diffImg);
img1Address = 'D:\Tel aviv university\Graphics\Assignment3\beach.pgm';
img2Address =  'D:\Tel aviv university\Graphics\Assignment3\example.pgm';
oriImg = imread(img1Address);
distRatio = 0.68
H=[1 .4 0; .3 1 0; 0.4 0.3 0.8];

afterImg = ComputeProjective(oriImg, H);
imwrite(afterImg, img2Address);

[num_of_matches matches distVals] = match(img1Address,img2Address, distRatio);
num_of_matches
computedH = DLT(matches);

calcImg = ComputeProjective(oriImg, computedH);
diffImg = appendimages(afterImg,calcImg);

[pnts_gt,pnts_computed] = ComputeTestPoints(H,computedH);
error = ComputeError(pnts_gt,pnts_computed) / size(pnts_gt,1)

sizediff = size(afterImg) - size(calcImg)

imshow(diffImg);
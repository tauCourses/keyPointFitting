img1Address = 'D:\Tel aviv university\Graphics\Assignment3\left.pgm';
img2Address =  'D:\Tel aviv university\Graphics\Assignment3\example.pgm';
oriImg = imread(img1Address);
H=[1 .2 0; .1 1 0; 0.5 0.2 1];

afterImg = ComputeProjective(oriImg, H);
imwrite(afterImg, img2Address);

[num matches distVals] = match(img1Address,img2Address, 0.68);
computedH = DLT(matches);

calcImg = ComputeProjective(img1, computedH);
diffImg = appendimages(afterImg,calcImg);

[pnts_gt,pnts_computed] = ComputeTestPoints(H,computedH);
error = ComputeError(pnts_gt,pnts_computed) / size(pnts_gt,1)

sizediff = size(afterImg) - size(calcImg)

imshow(diffImg);
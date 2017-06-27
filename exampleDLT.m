firstAddress = 'D:\Tel aviv university\Graphics\Assignment3\me1.pgm';
secondAddress =  'D:\Tel aviv university\Graphics\Assignment3\me2.pgm';
oriImg = imread(firstAddress);
H=[1 .4 0; .1 1 0; 0.5 0.3 0.9];

afterImg = imread(secondAddress);%ComputeProjective(oriImg, H);
%imwrite(afterImg, img2Address);

[num matches distVals] = match(img1Address,img2Address, 0.68);
computedH = DLT(matches);

calcImg = ComputeProjective(oriImg, computedH);
diffImg = appendimages(afterImg,calcImg);

% [pnts_gt,pnts_computed] = ComputeTestPoints(H,computedH);
% error = ComputeError(pnts_gt,pnts_computed) / size(pnts_gt,1)

sizediff = size(afterImg) - size(calcImg)

imshow(diffImg);
matan = 'D:\Tel aviv university\Graphics\Assignment3\example.pgm';
itay =  'D:\targil 3\book.pgm';

firstAddress = 'D:\targil 3\basket.jpg';
secondAddress =  'D:\targil 3\example.pgm';
minGroup = 4;
inlierTrashold = 0.1;
distRatio = 0.8;

%H=[1 .4 0; .3 1 0; 0.4 0.3 0.8];
H=[1 .2 0; .1 1 0; 0.5 0.2 1];

im1 = imread(firstAddress);
imwrite(im1,'D:\targil 3\basket.pgm');
oriImg = imread('D:\targil 3\basket.pgm');
%oriImg = imread(firstAddress);
afterImg = ComputeProjective(oriImg, H);
imwrite(afterImg, secondAddress);

[num_of_matches matches distVals] = match('D:\targil 3\basket.pgm',secondAddress, distRatio);
num_of_matches
computedH = RANSAC_Wrapper(matches,@fittingfn,@myDistfn,@degenfn,minGroup,inlierTrashold,0,100,1000);

calcImg = ComputeProjective(oriImg, computedH);
diffImg = appendimages(afterImg,calcImg);

[pnts_gt,pnts_computed] = ComputeTestPoints(H,computedH);
error = ComputeError(pnts_gt,pnts_computed) 
errorNormlized = error / size(pnts_gt,1)

sizediff = size(afterImg) - size(calcImg)

imshow(diffImg);

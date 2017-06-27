firstAddress = 'D:\Tel aviv university\Graphics\Assignment3\mahal.pgm';
H=[1 .4 0; .1 1 0; 0.5 0.3 0.9];
oriImg = imread(firstAddress);
afterImg = ComputeProjective(oriImg, H);
diffImg = appendimages(oriImg,afterImg);
imshow(diffImg);
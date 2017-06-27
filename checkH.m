firstAddress = 'D:\Tel aviv university\Graphics\Assignment3\mahal.pgm';
H=[1 .4 0; .4 1 0; 0.4 0.3 0.8];

oriImg = imread(firstAddress);
afterImg = ComputeProjective(oriImg, H);
diffImg = appendimages(oriImg,afterImg);
imshow(diffImg);
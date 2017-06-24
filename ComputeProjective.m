function [TransformIm] = ComputeProjective(Im, H)
%img = imread('D:\testRoom10JAR.png');
%dim = size(img);
%H = [1 .2 0; .1 1 0; 0.5 0.2 1]

tform = maketform('projective',H);
TransformIm = imtransform(Im,tform);

%figure;
%imshow(TransformIm);
%imwrite(img2, 'D:\output.bmp', 'bmp');

end

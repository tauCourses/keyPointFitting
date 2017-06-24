function [displayedCorr] = DisplayCorr(image1, image2, matches, dist_vals, x)

[num_of_matches, t] = size(matches);
for i = 1 : num_of_matches
    matches(i,5) = dist_vals(i);
end
matches = sortrows(matches,5);

x = min(num_of_matches,x);

displayedCorr(:,:) = matches(1:x,1:4);

% Create a new image showing the two images side by side.
im1 = imread(image1);
im2 = imread(image2);
im3 = appendimages(im1,im2);

% Show a figure with lines joining the accepted matches.
% figure('Position', [100 100 size(im3,2) size(im3,1)]);
colormap('gray');


cols1 = size(im1,2);
for i = 1: x
   im3 = insertText(im3, [displayedCorr(i,1) displayedCorr(i,2)] , i,'FontSize',35,'TextColor','red', 'BoxOpacity', 0, 'AnchorPoint', 'LeftCenter');
   im3 = insertText(im3, [displayedCorr(i,3)+cols1 displayedCorr(i,4)] , i,'FontSize',35,'TextColor','red', 'BoxOpacity', 0, 'AnchorPoint', 'LeftCenter');
  
end
warning('off', 'Images:initSize:adjustingMag');
imshow(im3)





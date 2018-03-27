% image_segmentation
% Output:
% B matrix with the number of pores detected, and his border location
% L Segment image binabinarized

he = imread('FOTO010.tif'); %Read the image
%he = imread('FOTO011.tif');
%he = imread('FOTO012.tif');
%he = imread('Imagem127.tif');
%he = imread('FOTO016.tif');

cform = makecform('srgb2lab');
lab_he = applycform(he,cform); % Converts the RGB Color Space Image to L*a*b. 
pause;


ab = double(lab_he(:,:,2:3));
nrows = size(ab,1);
ncols = size(ab,2);
ab = reshape(ab,nrows*ncols,2);

nColors = 3;
[cluster_idx, cluster_center] = kmeans(ab,nColors,'distance','sqEuclidean', ...
                                      'Replicates',3); % K-means Algorithm from Matlab.
pause

pixel_labels = reshape(cluster_idx,nrows,ncols);
figure,imshow(pixel_labels,[]), title('Resulting image');
pause

%Image classification acording to the K-means algorithm

segmented_images = cell(1,3);
rgb_label = repmat(pixel_labels,[1 1 3]);

for k = 1:nColors
    color = he;  %%%%%%%%%%%%%%%%%%%% entender %%%%%%%%%%%%%%%%%%%%%%%%%%%%
    color(rgb_label ~= k) = 0; %%%%%%%%%%%%%%%%%%% entender %%%%%%%%%%%%%%%% 
    segmented_images{k} = color; %%%%%%%%%%%%%%%%% entender %%%%%%%%%%%%%%%%
end

subplot(2,2,1);
imshow(he), title('original image');

subplot(2,2,2);
imshow(segmented_images{1}), title('Cluster 1');

cluster1=segmented_images{1};

subplot(2,2,3);
imshow(segmented_images{2}), title('Cluster 2');
cluster2=segmented_images{2};

subplot(2,2,4);
imshow(segmented_images{3}), title('Cluster 3');
cluster3=segmented_images{3};

prompt = 'Selec the classification?';
x = input(prompt);
switch x
    case 1
         Igray = rgb2gray(cluster1);
    case 2
         Igray = rgb2gray(cluster2);
    case 3
         Igray = rgb2gray(cluster3);
end
close all;     

% Bynary image transformation whit Otsu´s method to determine the global threshold  
tomgray = graythresh(Igray);
bw = im2bw(Igray,tomgray);



[m,n]=size(bw); % Morpphological operations to eliminate noise, delimited the countor, etc

np=5;
bw = bwareaopen(bw,np);
se = strel('disk',1);
bw = imdilate(bw,se);

%%%%%%%%%%%%%%%% probar otros resultados con las operaciones morfologicas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

bw = imfill(bw,'holes');

[B,L] = bwboundaries(bw,'noholes');

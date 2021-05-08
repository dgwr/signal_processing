
clc
clear
close all

img0 = imread('srcauhtx.jpeg');

tempsize = 8;
sigma1 = 10;
sigma2 = 0.1;

img = double(padarray(img0,[tempsize,tempsize],0))/255;

%通道提取
imgr = img(:,:,1);
imgg = img(:,:,2);
imgb = img(:,:,3);

[m,n] = size(imgr);

figure(1)
subplot(1,2,1)
imshow(img0)
title('原图')

%通道处理1
img(:,:,1) = B_filter(imgr,tempsize,sigma1,sigma2);

img(:,:,2) = B_filter(imgg,tempsize,sigma1,sigma2);

img(:,:,3) = B_filter(imgb,tempsize,sigma1,sigma2);

subplot(1,2,2)
imshow(img(tempsize+1:m-tempsize,tempsize+1:n-tempsize,:))
title('双边滤波处理原图')


function out = B_filter(Img,tempsize,sigma0,sigma1)

%模板定义

gauss = fspecial('gauss',2*tempsize+1,sigma0);

[m,n] = size(Img);


for i = 1+ tempsize : m - tempsize
    for j = 1+ tempsize : n - tempsize
       %提取处理区域得到梯度敏感矩阵
       temp = abs(Img(i - tempsize:i + tempsize,j - tempsize:j + tempsize) - Img(i,j));
       temp = exp(-temp.^2/(2*sigma1^2));
       %得到双边滤波器并将权值和化为一
       filter = gauss.*temp;
       filter = filter/sum(filter(:));
       %卷积
       Img(i,j) = sum(sum((Img(i - tempsize:i + tempsize,j - tempsize:j + tempsize).*filter)));
    end
end
       
out = Img;
end

function out = B_filter(Img,tempsize,sigma0,sigma1)

%ģ�嶨��

gauss = fspecial('gauss',2*tempsize+1,sigma0);

[m,n] = size(Img);


for i = 1+ tempsize : m - tempsize
    for j = 1+ tempsize : n - tempsize
       %��ȡ��������õ��ݶ����о���
       temp = abs(Img(i - tempsize:i + tempsize,j - tempsize:j + tempsize) - Img(i,j));
       temp = exp(-temp.^2/(2*sigma1^2));
       %�õ�˫���˲�������Ȩֵ�ͻ�Ϊһ
       filter = gauss.*temp;
       filter = filter/sum(filter(:));
       %���
       Img(i,j) = sum(sum((Img(i - tempsize:i + tempsize,j - tempsize:j + tempsize).*filter)));
    end
end
       
out = Img;
end

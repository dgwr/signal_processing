close all; clear all; clc;


accuracy=0.9999;
mailme('pattern recognition',['mission compeleted!  ',...
    'accuracy=',num2str(accuracy)]);

function mailme(mailtitle,mailcontent)
% �˺�����
mail = 'XXXX@163.com';  % �������ַ�������ˣ�
password = 'XXXX'; % ������

% ����������
setpref('Internet','E_mail',mail);
setpref('Internet','SMTP_Server','smtp.163.com'); % ��SMTP������
setpref('Internet','SMTP_Username',mail);
setpref('Internet','SMTP_Password',password);
props = java.lang.System.getProperties;
props.setProperty('mail.smtp.auth','true');
props.setProperty('mail.smtp.socketFactory.class', 'javax.net.ssl.SSLSocketFactory');
props.setProperty('mail.smtp.socketFactory.port','465');
% �����ʼ�
receiver='XXXXXXXX.com'; % ���ҵ��ռ����䣨�ռ��ˣ�
sendmail(receiver,mailtitle,mailcontent); % receiver--�ռ�������  mailtitle--�ʼ����� mailcontent--�ʼ�����
end

close all; clear all; clc;


accuracy=0.9999;
mailme('pattern recognition',['mission compeleted!  ',...
    'accuracy=',num2str(accuracy)]);

function mailme(mailtitle,mailcontent)
% 账号设置
mail = 'XXXX@163.com';  % ①邮箱地址（发件人）
password = 'XXXX'; % ②密码

% 服务器设置
setpref('Internet','E_mail',mail);
setpref('Internet','SMTP_Server','smtp.163.com'); % ③SMTP服务器
setpref('Internet','SMTP_Username',mail);
setpref('Internet','SMTP_Password',password);
props = java.lang.System.getProperties;
props.setProperty('mail.smtp.auth','true');
props.setProperty('mail.smtp.socketFactory.class', 'javax.net.ssl.SSLSocketFactory');
props.setProperty('mail.smtp.socketFactory.port','465');
% 发送邮件
receiver='XXXXXXXX.com'; % ④我的收件邮箱（收件人）
sendmail(receiver,mailtitle,mailcontent); % receiver--收件人邮箱  mailtitle--邮件标题 mailcontent--邮件内容
end

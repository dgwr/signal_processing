close all; clear all; clc;

c = 3e+8;
f = 1e+9;
t = 0:1e-11:10 / f;
lamda = c / f;
w = 2 * pi * f;
derad = pi / 180;
K = length(t);

tag = [-10, 0, 0; 5, 0, 0]';
anchor = [-lamda / 2, -10, 0; 0, -10, 0; lamda / 2, -10, 0]';
N = size(anchor, 2); % ��Ԫ��
M = size(tag, 2); % ��ǩ��
dd = 1/2;
d = 0:dd:(N - 1) * dd;

dist = [];
X = 0;
% dd = diag(randn(1, length(t)));
dd = [diag(randn(1, length(t))); diag(randn(1, length(t)))];

for n = 1:M
    dist = [dist, sum((anchor - tag(:, n)).^2).^0.5'];
    out = (cos(w * (t - dist(:, n) / c)) + 1j * sin(w * (t - dist(:, n) / c))) * dd((n - 1) * 1001 + 1:n * 1001, :);
    %     X = X + (cos(w * (t - dist(:, n) / c)) + 1j * sin(w * (t - dist(:, n) / c))) * diag(randn(1, length(t)));
    X = X + out;
end

% S=randn(M,K);             %��Դ�źţ������ź�
% X=A*S;                    %��������ź�
% X1=awgn(X,snr,'measured');%�����Ը�˹������ӵ��ź���

Rxx = X * X' / K;
[EV, D] = eig(Rxx);
EVA = diag(D)';
[EVA, I] = sort(EVA);
EV = fliplr(EV(:, I));

for iang = 1:361
    angle(iang) = (iang - 181) / 2;
    phim = derad * angle(iang);
    a = exp(1i * 2 * pi * d * sin(phim)).'; % ��������
    %     a = exp(-1i * 2 * pi * d * diag(sin(phim-[0,0,-pi/3]))).';  % ��������
    %     a = exp(-1i * 2 * pi * d * diag(sin(phim-[0,0,pi/4,pi/2]))).'; % ��������
    En = EV(:, M + 1:N); % ȡ����ĵ�M+1��N����������ӿռ�
    Pmusic(iang) = 1 / (a' * En * En' * a);
end

Pmusic = abs(Pmusic);
Pmmax = max(Pmusic);
Pmusic = 10 * log10(Pmusic / Pmmax); % ��һ������
h = plot(angle, Pmusic);
set(h, 'Linewidth', 2);
xlabel('�����/(degree)');
ylabel('�ռ���/(dB)');
set(gca, 'XTick', [-180:30:180]);
grid on;

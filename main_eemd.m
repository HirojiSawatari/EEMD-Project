TSData = ncread('E:\data\yFTS.nc','ts');
subplot(11,2,1);
plot(TSData);
IMF = eemd(TSData(:),0.25,1000);
for i=2:9
    subplot(11,2,i);
    plot(IMF(:,i), 'r');
    hold on
    plot(1:0.8:2000, 0, 'k');
    set(gca,'YLim',[-1,1],'YTick',[-1:1])
end
Y =fft(detrend(IMF(:,2)));       %快速FFT变换
N = length(Y);    %FFT变换后数据长度
power = abs(Y(1:N/2)).^2;  %求功率谱
nyquist = 1/2;
freq = (1:N/2)/(N/2)*nyquist; %求频率
subplot(11,2,10);
plot(freq,power); grid on     %绘制功率谱图
xlabel('频率')
ylabel('功率')
title('功率谱图')
period = 1./freq;                %计算周期
subplot(11,2,11);
plot(period,power); grid on  %绘制周期－功率谱曲线
ylabel('功率')
xlabel('周期')
title('周期—功率谱图')
[mp,index] = max(power);       %求最高谱线所对应的下标
T_mean=period(index);            %由下标求出平均周期
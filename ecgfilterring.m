t=(0:1:4999)/500
figure(1)
plot(t,val)
xlabel("Time")
ylabel("Amplitude")
title("Unfiltered")
figure(2)
fecg=(0:1:4999)*500/5000
fftecg=fft(val,5000)
plot(fecg,abs(fftecg))
xlabel("Frequency")
ylabel("Magnitude")
title("FFT of unfiltered ecg")
wp=[1.14,45]
n=6
[b,a]=butter(6,wp/250)
filterdecg=filter(b,a,val);
figure(3)
plot(t,filterdecg)
xlabel("Time")
ylabel("Amplitude")
title("filtered Ecg")
ffiltecg=fft(filterdecg)
figure(4)
plot(fecg,abs(ffiltecg))
xlabel("frequency")
ylabel("Magnitude")
title("Frequency content of filtered ecg")
h=ones([1,15])/15
filterdecg=filter(h,1,filterdecg)
figure(5)
plot(t(1:2000),filterdecg(1:2000))
xlabel("Time")
ylabel("Magnitude")
title("Smoothend Ecg")

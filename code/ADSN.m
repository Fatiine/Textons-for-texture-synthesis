function t = ADSN(u)

m=mean(mean(u));
[h,l]=size(u);

%image normalisee et sa TFD
un=u-m*ones(size(u));
un=un/(h*l);
U=fft2(un);

%bruit gaussien et FFT
n=randn(size(u));
N=fft2(n);

%bruit final
B=U.*N;
b=ifft2(B);

%add the mean value 
t=b+m;


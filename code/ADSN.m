function t = ADSN(u)

m=mean(mean(u));
[h,l]=size(u);

% normalize image and its FFT
un=normalize_image(u);
U=fft2(un);

%bruit gaussien et FFT
n=randn(size(u));
N=fft2(n);

%bruit final
B=U.*N;
b=ifft2(B);

%add the mean value 
t=b+m;


function t = ADSN(u)

m=mean(mean(u));
[h,l]=size(u);

% Normalized image and it FFT
un=u-m*ones(size(u));
un=un/(h*l);
U=fft2(un);

% Random Noise
n=randn(size(u));
N=fft2(n);

B=U.*N;
b=ifft2(B);

%add the mean value 
t=b+m;


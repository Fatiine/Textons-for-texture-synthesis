function [p] = per_decomp_smooth(u)
[M,N] = size(u); 
u = double(u);
X = 1:N; Y = 1:M;
v = zeros(M,N);
v(1,X)  = u(1,X)-u(M,X);
v(M,X) = -v(1,X);
v(Y,1 ) = v(Y,1 )+u(Y,1)-u(Y,N);
v(Y,N) = v(Y,N)-u(Y,1)+u(Y,N);
fx = repmat(cos(2.*pi*(X -1)/N),M,1);
fy = repmat(cos(2.*pi*(Y'-1)/M),1,N);
fx(1,1)=0.;   % avoid division by 0 in the line below
s = real(ifft2(fft2(v)*0.5./(2.-fx-fy)));
p = u-s;

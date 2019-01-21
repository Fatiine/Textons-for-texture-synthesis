function t = ADSN_color(u)
u = double(u);
[M,N,C] = size(u);
% Mean of the image 
m = repmat(mean(mean(u),2), [M,N,1]);

% Convolution of the kernel s with a normal Gaussian white noise.
t = zeros(M,N,C);
W = randn(M,N);
fW = fft2(W);
for c=1:C
    t(:,:,c) = u(:,:,c) - mean(mean(u(:,:,c)))*ones(size(u(:,:,c)));
    t(:,:,c) = real(ifft2(fft2(t(:,:,c)).*fW));
end

t = t/sqrt(M*N) + m;
t = uint8(t);

end
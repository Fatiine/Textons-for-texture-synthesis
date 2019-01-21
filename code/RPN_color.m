function b = RPN_color(a)
A=fft2(a); n=randn(size(a(:,:,1)));
N=fft2(n); B=zeros(size(a));
B(:,:,1)=abs(A(:,:,1)).*exp(1i*(angle(A(:,:,1))+angle(N)));
B(:,:,2)=abs(A(:,:,2)).*exp(1i*(angle(A(:,:,2))+angle(N)));
B(:,:,3)=abs(A(:,:,3)).*exp(1i*(angle(A(:,:,3))+angle(N)));
b=real(ifft2(B));
b=uint8(b);
end
function b = RPN(a)
A=fft2(a);
n=randn(size(a));
N=fft2(n);
B=abs(A).*exp(1i*angle(N));
b=real(ifft2(B)); 
end
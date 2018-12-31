function t = Texton(u)
U=fft2(u);
v=abs(U);
[M,N]=size(u);
c1=floor((M/2)+1);
c2=floor((N/2)+1);
v(c1,c2)= U(c1,c2);
t=fftshift(ifft2(v));

 

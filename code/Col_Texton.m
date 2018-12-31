function t = Col_Texton(u,alpha)
alpha_u=zeros(size(u(:,:,1)));
[M,N]=size(alpha_u)
for k=1:M
    for j=1:N
        alpha_u(k,j)=double([u(k,j,1) u(k,j,2) u(k,j,3)])*alpha;
    end
end
alpha_U=fft2(alpha_u);
U=fft2(u)
Texton=zeros(size(u))
Texton(:,:,1)=abs(U(:,:,1)).*exp(i*(angle(U(:,:,1))-angle(alpha_U)));
Texton(:,:,2)=abs(U(:,:,2)).*exp(i*(angle(U(:,:,2))-angle(alpha_U)));
Texton(:,:,3)=abs(U(:,:,3)).*exp(i*(angle(U(:,:,3))-angle(alpha_U)));
texton=ifft2(Texton)
texton(:,:,1)=fftshift(texton(:,:,1))
texton(:,:,2)=fftshift(texton(:,:,2))
texton(:,:,3)=fftshift(texton(:,:,3))

t=uint8(texton)
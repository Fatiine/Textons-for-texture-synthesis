a=imread('wall.png');
%Niveaux de gris
a=mean(a,3);
%Afficher l'image
figure
imagesc(a);colormap gray;
title('Original')
%Texton
l=Texton(a);
l=uint8(l);
I = double(l);
I=fftshift(I);
I=normalize_image(I);
%Afficher Texton
figure
imagesc(I);colormap gray;
title('Texton')
%Seuillage
I1=I;
I1(I1<200 & I1>1)=100;
imagesc(I1);colormap gray;
figure
imagesc(I1);colormap gray;
title('Texton thresholding')
% Randomization
[M,N]=size(I1)
I2=100*ones(size(I1)*2);
I2(1:M,1:N)=I1;
A=fft2(I2);
n=randn(size(I2));
N=fft2(n);
B=abs(A).*exp(i*angle(N));
b=real(ifft2(B));
figure
imagesc(b);colormap gray;
title(" synthesize texture after phase randomization")


%Afficher La matrice de covariance de a
imagesc(cov(a));colormap gray;

%Afficher le composant périodique
[C,s] = per_decomp_smooth(a);
%C = normalize_image(C);

% mydisp = @(x)log10(abs(fftshift(x))+1e-5);
% clf;
% subplot(1,2,1);
% imagesc(mydisp(a));colormap gray;
% title('Original');
% subplot(1,2,2);
% imagesc(mydisp(C));colormap gray;
% title('Periodic layer');
figure
imagesc(C);colormap gray;


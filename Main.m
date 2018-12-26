a=imread('wall.png');
a=mean(a,3);
l=Texton(a);
l=uint8(l);
I = double(l);
%Afficher Texton
I=fftshift(I)
I=normalize_image(I)
imagesc(I);colormap gray;

%Afficher La matrice de covariance de a
imagesc(cov(a));colormap gray;


